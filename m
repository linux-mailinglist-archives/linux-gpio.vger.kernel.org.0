Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD9312079A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 14:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbfLPNvp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 08:51:45 -0500
Received: from mga06.intel.com ([134.134.136.31]:39019 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727928AbfLPNvp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Dec 2019 08:51:45 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 05:51:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; 
   d="scan'208";a="221503295"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by fmsmga001.fm.intel.com with SMTP; 16 Dec 2019 05:51:36 -0800
Received: by stinkbox (sSMTP sendmail emulation); Mon, 16 Dec 2019 15:51:35 +0200
Date:   Mon, 16 Dec 2019 15:51:35 +0200
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
Subject: Re: [PATCH 2/5] drm/i915/dsi: Move poking of panel-enable GPIO to
 intel_dsi_vbt.c
Message-ID: <20191216135135.GR1208@intel.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191215163810.52356-3-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 15, 2019 at 05:38:07PM +0100, Hans de Goede wrote:
> On some older devices (BYT, CHT) which may use v2 VBT MIPI-sequences,
> we need to manually control the panel enable GPIO as v2 sequences do
> not do this.
> 
> So far we have been carrying the code to do this on BYT/CHT devices
> with a Crystal Cove PMIC in vlv_dsi.c, but as this really is a shortcoming
> of the VBT MIPI-sequences, intel_dsi_vbt.c is a better place for this,
> so move it there.
> 
> This is a preparation patch for adding panel-enable and backlight-enable
> GPIO support for BYT devices where instead of the PMIC the SoC is used
> for backlight control.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi.h     |  2 +
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 46 +++++++++++++++++++-
>  drivers/gpu/drm/i915/display/vlv_dsi.c       | 27 +-----------
>  3 files changed, 48 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i915/display/intel_dsi.h
> index b15be5814599..de7e51cd3460 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi.h
> +++ b/drivers/gpu/drm/i915/display/intel_dsi.h
> @@ -203,6 +203,8 @@ void bxt_dsi_reset_clocks(struct intel_encoder *encoder, enum port port);
>  
>  /* intel_dsi_vbt.c */
>  bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id);
> +void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi);
> +void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi);
>  void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
>  				 enum mipi_seq seq_id);
>  void intel_dsi_msleep(struct intel_dsi *intel_dsi, int msec);
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> index f90946c912ee..5352e8c9eca5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -453,8 +453,8 @@ static const char *sequence_name(enum mipi_seq seq_id)
>  		return "(unknown)";
>  }
>  
> -void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
> -				 enum mipi_seq seq_id)
> +static void intel_dsi_vbt_exec(struct intel_dsi *intel_dsi,
> +			       enum mipi_seq seq_id)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(intel_dsi->base.base.dev);
>  	const u8 *data;
> @@ -519,6 +519,18 @@ void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
>  	}
>  }
>  
> +void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
> +				 enum mipi_seq seq_id)
> +{
> +	if (seq_id == MIPI_SEQ_POWER_ON && intel_dsi->gpio_panel)
> +		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 1);
> +
> +	intel_dsi_vbt_exec(intel_dsi, seq_id);
> +
> +	if (seq_id == MIPI_SEQ_POWER_OFF && intel_dsi->gpio_panel)
> +		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 0);
> +}
> +
>  void intel_dsi_msleep(struct intel_dsi *intel_dsi, int msec)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(intel_dsi->base.base.dev);
> @@ -671,3 +683,33 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
>  
>  	return true;
>  }
> +
> +/*
> + * On some BYT/CHT devs some sequences are incomplete and we need to manually
> + * control some GPIOs.
> + */
> +void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi)
> +{
> +	struct drm_device *dev = intel_dsi->base.base.dev;
> +	struct drm_i915_private *dev_priv = to_i915(dev);
> +	struct mipi_config *mipi_config = dev_priv->vbt.dsi.config;
> +
> +	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
> +	    (mipi_config->pwm_blc == PPS_BLC_PMIC)) {

Pointless parens around ==

Otherwise seems fine.

Reviewed-by: Ville Syrj�l� <ville.syrjala@linux.intel.com>

> +		intel_dsi->gpio_panel =
> +			gpiod_get(dev->dev, "panel", GPIOD_OUT_HIGH);
> +
> +		if (IS_ERR(intel_dsi->gpio_panel)) {
> +			DRM_ERROR("Failed to own gpio for panel control\n");
> +			intel_dsi->gpio_panel = NULL;
> +		}
> +	}
> +}
> +
> +void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
> +{
> +	if (intel_dsi->gpio_panel) {
> +		gpiod_put(intel_dsi->gpio_panel);
> +		intel_dsi->gpio_panel = NULL;
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 6865fd4b5883..178d0fffba5b 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -23,7 +23,6 @@
>   * Author: Jani Nikula <jani.nikula@intel.com>
>   */
>  
> -#include <linux/gpio/consumer.h>
>  #include <linux/slab.h>
>  
>  #include <drm/drm_atomic_helper.h>
> @@ -797,9 +796,6 @@ static void intel_dsi_pre_enable(struct intel_encoder *encoder,
>  	if (!IS_GEMINILAKE(dev_priv))
>  		intel_dsi_prepare(encoder, pipe_config);
>  
> -	/* Power on, try both CRC pmic gpio and VBT */
> -	if (intel_dsi->gpio_panel)
> -		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 1);
>  	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_POWER_ON);
>  	intel_dsi_msleep(intel_dsi, intel_dsi->panel_on_delay);
>  
> @@ -943,11 +939,8 @@ static void intel_dsi_post_disable(struct intel_encoder *encoder,
>  	/* Assert reset */
>  	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_ASSERT_RESET);
>  
> -	/* Power off, try both CRC pmic gpio and VBT */
>  	intel_dsi_msleep(intel_dsi, intel_dsi->panel_off_delay);
>  	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_POWER_OFF);
> -	if (intel_dsi->gpio_panel)
> -		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 0);
>  
>  	/*
>  	 * FIXME As we do with eDP, just make a note of the time here
> @@ -1539,10 +1532,7 @@ static void intel_dsi_encoder_destroy(struct drm_encoder *encoder)
>  {
>  	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
>  
> -	/* dispose of the gpios */
> -	if (intel_dsi->gpio_panel)
> -		gpiod_put(intel_dsi->gpio_panel);
> -
> +	intel_dsi_vbt_gpio_cleanup(intel_dsi);
>  	intel_encoder_destroy(encoder);
>  }
>  
> @@ -1920,20 +1910,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
>  
>  	vlv_dphy_param_init(intel_dsi);
>  
> -	/*
> -	 * In case of BYT with CRC PMIC, we need to use GPIO for
> -	 * Panel control.
> -	 */
> -	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
> -	    (dev_priv->vbt.dsi.config->pwm_blc == PPS_BLC_PMIC)) {
> -		intel_dsi->gpio_panel =
> -			gpiod_get(dev->dev, "panel", GPIOD_OUT_HIGH);
> -
> -		if (IS_ERR(intel_dsi->gpio_panel)) {
> -			DRM_ERROR("Failed to own gpio for panel control\n");
> -			intel_dsi->gpio_panel = NULL;
> -		}
> -	}
> +	intel_dsi_vbt_gpio_init(intel_dsi);
>  
>  	drm_connector_init(dev, connector, &intel_dsi_connector_funcs,
>  			   DRM_MODE_CONNECTOR_DSI);
> -- 
> 2.23.0

-- 
Ville Syrj�l�
Intel
