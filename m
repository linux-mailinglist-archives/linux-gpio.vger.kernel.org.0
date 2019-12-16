Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6676612077D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 14:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbfLPNp5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 08:45:57 -0500
Received: from mga01.intel.com ([192.55.52.88]:16751 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727826AbfLPNp5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Dec 2019 08:45:57 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 05:45:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; 
   d="scan'208";a="266257611"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by FMSMGA003.fm.intel.com with SMTP; 16 Dec 2019 05:45:51 -0800
Received: by stinkbox (sSMTP sendmail emulation); Mon, 16 Dec 2019 15:45:51 +0200
Date:   Mon, 16 Dec 2019 15:45:51 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/i915/dsi: Init panel-enable GPIO to low when the
 LCD is initially off
Message-ID: <20191216134551.GQ1208@intel.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191215163810.52356-4-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 15, 2019 at 05:38:08PM +0100, Hans de Goede wrote:
> When the LCD has not been turned on by the firmware/GOP, because e.g. the
> device was booted with an external monitor connected over HDMI, we should
> not turn on the panel-enable GPIO when we request it.
> 
> Turning on the panel-enable GPIO when we request it, means we turn it on
> too early in the init-sequence, which causes some panels to not correctly
> light up.
> 
> This commits adds a panel_is_on parameter to intel_dsi_vbt_gpio_init()
> and makes intel_dsi_vbt_gpio_init() set the initial GPIO value accordingly.
> 
> This fixes the panel not lighting up on a Thundersoft TST168 tablet when
> booted with an external monitor connected over HDMI.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi.h     | 2 +-
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 7 +++----
>  drivers/gpu/drm/i915/display/vlv_dsi.c       | 2 +-
>  3 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i915/display/intel_dsi.h
> index de7e51cd3460..675771ea91aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi.h
> +++ b/drivers/gpu/drm/i915/display/intel_dsi.h
> @@ -203,7 +203,7 @@ void bxt_dsi_reset_clocks(struct intel_encoder *encoder, enum port port);
>  
>  /* intel_dsi_vbt.c */
>  bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id);
> -void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi);
> +void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on);
>  void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi);
>  void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
>  				 enum mipi_seq seq_id);
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> index 5352e8c9eca5..027970348b22 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -688,17 +688,16 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
>   * On some BYT/CHT devs some sequences are incomplete and we need to manually
>   * control some GPIOs.
>   */
> -void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi)
> +void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>  {
>  	struct drm_device *dev = intel_dsi->base.base.dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
>  	struct mipi_config *mipi_config = dev_priv->vbt.dsi.config;
> +	enum gpiod_flags flags = panel_is_on ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;

Can't we just tell it not to change the current setting?

>  
>  	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>  	    (mipi_config->pwm_blc == PPS_BLC_PMIC)) {
> -		intel_dsi->gpio_panel =
> -			gpiod_get(dev->dev, "panel", GPIOD_OUT_HIGH);
> -
> +		intel_dsi->gpio_panel = gpiod_get(dev->dev, "panel", flags);
>  		if (IS_ERR(intel_dsi->gpio_panel)) {
>  			DRM_ERROR("Failed to own gpio for panel control\n");
>  			intel_dsi->gpio_panel = NULL;
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 178d0fffba5b..e86e4a11e199 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1910,7 +1910,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
>  
>  	vlv_dphy_param_init(intel_dsi);
>  
> -	intel_dsi_vbt_gpio_init(intel_dsi);
> +	intel_dsi_vbt_gpio_init(intel_dsi, current_mode != NULL);
>  
>  	drm_connector_init(dev, connector, &intel_dsi_connector_funcs,
>  			   DRM_MODE_CONNECTOR_DSI);
> -- 
> 2.23.0

-- 
Ville Syrjälä
Intel
