Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C71771A876F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 19:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407630AbgDNRZC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 13:25:02 -0400
Received: from mga12.intel.com ([192.55.52.136]:49738 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407592AbgDNRZB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 13:25:01 -0400
IronPort-SDR: 54JzAPqM1Ik8mlKP56j/klj+Sz+sY26/El47khJg+38XVEdRYHP0wZgh4ujk64/f4dnlpH24sq
 FK0/86rR145Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 10:24:59 -0700
IronPort-SDR: xlHs8W7KkTNiYUqjgzghdeYN2bxqCo5LerU2aDyjK9kylOT0QjL+HpDdT2nXSFZCMyW9ghrHWu
 LQ7pKUVKR8vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="454631045"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2020 10:24:56 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOPIx-000ZtJ-5F; Tue, 14 Apr 2020 20:24:59 +0300
Date:   Tue, 14 Apr 2020 20:24:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
        Daniel Matuschek <daniel@hifiberry.com>,
        Matthias Reichl <hias@horus.com>,
        Hui Wang <hui.wang@canonical.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 05/16] ASoC: Intel: sof-pcm512x: reconfigure sclk in
 hw_params if needed
Message-ID: <20200414172459.GE34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-6-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409195841.18901-6-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 02:58:30PM -0500, Pierre-Louis Bossart wrote:
> The SCLK is resumed by the codec driver. In case the rate specified in
> hw_params does not match the current configuration, disable, set the
> new rate and restart the clock.
> 
> There is no operation on hw_free, the codec suspend routine will
> disable/deprepare the clock.
> 
> Note that we don't change the DAI configuration when the DAC+ PRO is
> detected. All changes for the codec master mode are handled in the
> topology file (DAI configuration change and scheduling change)

...

> +	err = snd_interval_ratnum(hw_param_interval(params,
> +						    SNDRV_PCM_HW_PARAM_RATE),
> +				  1, &rats_no_pll, &num, &den);

> +	if (err >= 0 && den) {

Perhaps usual pattern, i.e.

	if (err < 0 || !den)
		return 0;
(so, above seems optional configuration)

	params...;
	return 0;

> +		params->rate_num = num;
> +		params->rate_den = den;
> +	}
> +
> +	return 0;

...

> +static int aif1_hw_params(struct snd_pcm_substream *substream,
> +			  struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
> +	struct device *dev = rtd->card->dev;
> +	int current_rate;
> +	int sclk_rate;
> +	int channels;
> +	int width;
> +	int rate;
> +	int ret = 0;
> +

> +	if (ctx->is_dac_pro) {

	if (!...)
		return 0;

...and drop the redundant ret assignment above.

> +		rate = params_rate(params);
> +		channels = params_channels(params);
> +		width = snd_pcm_format_physical_width(params_format(params));
> +
> +		if (rate % 24000)
> +			sclk_rate = 22579200;
> +		else
> +			sclk_rate = 24576000;
> +
> +		current_rate = clk_get_rate(ctx->sclk);
> +		if (current_rate != sclk_rate) {
> +			/*
> +			 * The sclk clock is started and stopped by the codec
> +			 * resume/suspend functions. If the rate isn't correct,
> +			 * stop, set the new rate and restart the clock
> +			 */
> +
> +			dev_dbg(dev, "reconfiguring SCLK to rate %d\n",
> +				sclk_rate);
> +
> +			clk_disable_unprepare(ctx->sclk);
> +
> +			ret = clk_set_rate(ctx->sclk, sclk_rate);
> +			if (ret) {
> +				dev_err(dev, "Could not set SCLK rate %d\n",
> +					sclk_rate);
> +				return ret;
> +			}
> +
> +			ret = clk_prepare_enable(ctx->sclk);
> +			if (ret) {
> +				dev_err(dev, "Failed to enable SCLK: %d\n",
> +					ret);
> +				return ret;
> +			}
> +		}
> +
> +		ret = aif1_update_rate_den(substream, params);
> +		if (ret) {
> +			dev_err(dev, "Failed to update rate denominator: %d\n", ret);
> +			return ret;
> +		}

Do you still need below steps when current_rate == sclk_rate?

> +		ret = snd_soc_dai_set_bclk_ratio(rtd->codec_dai,
> +						 channels * width);
> +		if (ret) {
> +			dev_err(dev, "Failed to set bclk ratio : %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko


