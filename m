Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5C94DE865
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 11:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbfJUJqN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 05:46:13 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36035 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfJUJqN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 05:46:13 -0400
Received: by mail-wm1-f66.google.com with SMTP id c22so2942381wmd.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2019 02:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fXFSL90J7c4buB7BgLBmHZ5lnCDBYf3j20T/r5e8A4s=;
        b=EbJeUnWlfsKY640lhMPOf3ebWLAkEFNb/U1WJ40EyuAUp1gxohA3HpqvE5WO8ISy+j
         aqRaJE50AV7dYf5amcQoQ5zrbTghsD9NIgKoQO56mX0i95E4SY0j/KPJsW/uPU1kWN8K
         QbC9Ol/3sg6a2ZE2esxxdOnxeXk7Ycr4maLPdvpi8dL4lcZoLmOcE9e2M3ZrV5LPg/6X
         ZbvI7nj1L2dxZehFkBhTdEz/NAjMBcBT60uBShWj99And2VWaIKam9bnCvZG6daIMojQ
         soX3us0r0dX5xnwAvY3+mg19ldgNeTf2ORseG3+KhzuGjYL/KJvcOfjjweq1AMdsfN4e
         pchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fXFSL90J7c4buB7BgLBmHZ5lnCDBYf3j20T/r5e8A4s=;
        b=YyVgpOeCTimS2fnjOVRiGfV0c8fQuvRxsQQZcUjirdpgupnsW6RSpxwIdd0ffCIRKk
         doxGMLX/ug+zSyzPlclRKMs3h5AI71rVx4rZ6xOc90DXjrRrZADGoLy9dvf2zDbWL/8L
         8O+1zO8MNiWEh7fGG7xOCj1mpBj/68Ca9G3kIRVqmKmHmXLNbjy/Szok2hZhjYyOw/ht
         ybeX4iojgq96Kapn2qDpZbmUBxPukayx56db2B1Y30JpZ2BXaNEX14J933zrmHN6LOhD
         86Yx+zX4bKo4UQuyIkoOnM/zyx8k1VASnoTzo8PYXdsYkIxsZNMRh243M3lVjCQqReD0
         zGkA==
X-Gm-Message-State: APjAAAWRpEu0OleR1pGgubOPRfaTlqSHejDdJbdnRpeKE8dnmH7r8ILC
        Qy+6rbKLND5bHm8bxrASQOvcXKV2IfU=
X-Google-Smtp-Source: APXvYqxUdkhtfhowZzy2jS/StVeCOau2lyL62wXyn19ZswpQNA+KLfL/I5aeCksM1lJO99HpWgwrPw==
X-Received: by 2002:a1c:4046:: with SMTP id n67mr3772965wma.2.1571651167881;
        Mon, 21 Oct 2019 02:46:07 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id q22sm12377909wmj.31.2019.10.21.02.46.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 02:46:07 -0700 (PDT)
Subject: Re: [PATCH v2 05/11] ASoC: wcd934x: add playback dapm widgets
To:     Cezary Rojewski <cezary.rojewski@intel.com>
Cc:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        lee.jones@linaro.org, vinod.koul@linaro.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org, linux-gpio@vger.kernel.org
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-6-srinivas.kandagatla@linaro.org>
 <e0049071-7fb7-7f9a-e79f-102c1a9c8d20@intel.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <00d86ed7-564b-9999-171a-01bd47d91924@linaro.org>
Date:   Mon, 21 Oct 2019 10:46:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e0049071-7fb7-7f9a-e79f-102c1a9c8d20@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Rojewski for taking time to review.

On 20/10/2019 21:05, Cezary Rojewski wrote:
> On 2019-10-18 02:18, Srinivas Kandagatla wrote:
>> +static int wcd934x_codec_enable_slim(struct snd_soc_dapm_widget *w,
>> +                     struct snd_kcontrol *kc,
>> +                       int event)
>> +{
>> +    struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
>> +    struct wcd934x_codec *wcd = snd_soc_component_get_drvdata(comp);
>> +    struct wcd_slim_codec_dai_data *dai = &wcd->dai[w->shift];
>> +
>> +    switch (event) {
>> +    case SND_SOC_DAPM_POST_PMU:
>> +        wcd934x_codec_enable_int_port(dai, comp);
>> +        break;
>> +    case SNDRV_PCM_TRIGGER_STOP:
>> +        break;
> 
> Any reason for mentioning _TRIGGER_STOP here?
Looks like copy paste error.. no reason for this to be here!!

> 
>> +    case SND_SOC_DAPM_POST_PMD:
>> +        kfree(dai->sconfig.chs);
>> +
>> +        break;
> 
> Comment for kfree depending on _event_ would be advised.
> 
I could probably move this to hw_free callback.

>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void wcd934x_codec_hd2_control(struct snd_soc_component 
>> *component,
>> +                      u16 interp_idx, int event)
>> +{
>> +    u16 hd2_scale_reg;
>> +    u16 hd2_enable_reg = 0;
>> +
>> +    switch (interp_idx) {
>> +    case INTERP_HPHL:
>> +        hd2_scale_reg = WCD934X_CDC_RX1_RX_PATH_SEC3;
>> +        hd2_enable_reg = WCD934X_CDC_RX1_RX_PATH_CFG0;
>> +        break;
>> +    case INTERP_HPHR:
>> +        hd2_scale_reg = WCD934X_CDC_RX2_RX_PATH_SEC3;
>> +        hd2_enable_reg = WCD934X_CDC_RX2_RX_PATH_CFG0;
>> +        break;
>> +    }
> 
> What's the rest of this function for if switch-case does not match?
> Without hd2_enable_reg > 0 you might as well return immediately.
> 
we could do that too! I will try to clean this bit up in next version.
>> +
>> +    if (hd2_enable_reg && SND_SOC_DAPM_EVENT_ON(event)) {
>> +        snd_soc_component_update_bits(component, hd2_scale_reg,
>> +                      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_MASK,
>> +                      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_0P3125);
>> +        snd_soc_component_update_bits(component, hd2_enable_reg,
>> +                      WCD934X_CDC_RX_PATH_CFG_HD2_EN_MASK,
>> +                      WCD934X_CDC_RX_PATH_CFG_HD2_ENABLE);
>> +    }
>> +
>> +    if (hd2_enable_reg && SND_SOC_DAPM_EVENT_OFF(event)) {
>> +        snd_soc_component_update_bits(component, hd2_enable_reg,
>> +                      WCD934X_CDC_RX_PATH_CFG_HD2_EN_MASK,
>> +                      WCD934X_CDC_RX_PATH_CFG_HD2_DISABLE);
>> +        snd_soc_component_update_bits(component, hd2_scale_reg,
>> +                      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_MASK,
>> +                      WCD934X_CDC_RX_PATH_SEC_HD2_ALPHA_0P0000);
>> +    }
>> +}
>> +
>> +static void wcd934x_codec_hphdelay_lutbypass(struct snd_soc_component 
>> *comp,
>> +                         u16 interp_idx, int event)
>> +{
>> +    u8 hph_dly_mask;
>> +    u16 hph_lut_bypass_reg = 0;
>> +    u16 hph_comp_ctrl7 = 0;
>> +
>> +    switch (interp_idx) {
>> +    case INTERP_HPHL:
>> +        hph_dly_mask = 1;
>> +        hph_lut_bypass_reg = WCD934X_CDC_TOP_HPHL_COMP_LUT;
>> +        hph_comp_ctrl7 = WCD934X_CDC_COMPANDER1_CTL7;
>> +        break;
>> +    case INTERP_HPHR:
>> +        hph_dly_mask = 2;
>> +        hph_lut_bypass_reg = WCD934X_CDC_TOP_HPHR_COMP_LUT;
>> +        hph_comp_ctrl7 = WCD934X_CDC_COMPANDER2_CTL7;
>> +        break;
>> +    default:
>> +        break;
>> +    }
> 
> 'Default' made it here, what was not the case for most of other 
> switch-case. Keep code consistent would be appreciated.
> Moreover, in the following function "wcd934x_config_compander", you do 
> decide to do all the processing directly within switch-case. I see no 
> reason why you should not do that here too.
> 
> Again, once switch-case fails to find match, the rest of function does 
> not do much, really.
> 
> 
>> +
>> +    if (hph_lut_bypass_reg && SND_SOC_DAPM_EVENT_ON(event)) {
>> +        snd_soc_component_update_bits(comp, WCD934X_CDC_CLSH_TEST0,
>> +                          hph_dly_mask, 0x0);
>> +        snd_soc_component_update_bits(comp, hph_lut_bypass_reg,
>> +                          WCD934X_HPH_LUT_BYPASS_MASK,
>> +                          WCD934X_HPH_LUT_BYPASS_ENABLE);
>> +    }
>> +
>> +    if (hph_lut_bypass_reg && SND_SOC_DAPM_EVENT_OFF(event)) {
>> +        snd_soc_component_update_bits(comp, WCD934X_CDC_CLSH_TEST0,
>> +                          hph_dly_mask, hph_dly_mask);
>> +        snd_soc_component_update_bits(comp, hph_lut_bypass_reg,
>> +                          WCD934X_HPH_LUT_BYPASS_MASK,
>> +                          WCD934X_HPH_LUT_BYPASS_DISABLE);
>> +    }
>> +}
>> +
>> +static int wcd934x_config_compander(struct snd_soc_component *comp,
>> +                    int interp_n, int event)
>> +{
>> +    struct wcd934x_codec *wcd = dev_get_drvdata(comp->dev);
>> +    int compander;
>> +    u16 comp_ctl0_reg, rx_path_cfg0_reg;
>> +
>> +    /* EAR does not have compander */
>> +    if (!interp_n)
>> +        return 0;
>> +
>> +    compander = interp_n - 1;
>> +    if (!wcd->comp_enabled[compander])
>> +        return 0;
>> +
>> +    comp_ctl0_reg = WCD934X_CDC_COMPANDER1_CTL0 + (compander * 8);
>> +    rx_path_cfg0_reg = WCD934X_CDC_RX1_RX_PATH_CFG0 + (compander * 20);
>> +
>> +    switch (event) {
>> +    case SND_SOC_DAPM_PRE_PMU:
>> +        /* Enable Compander Clock */
>> +        snd_soc_component_update_bits(comp, comp_ctl0_reg,
>> +                          WCD934X_COMP_CLK_EN_MASK,
>> +                          WCD934X_COMP_CLK_ENABLE);
>> +        snd_soc_component_update_bits(comp, comp_ctl0_reg,
>> +                          WCD934X_COMP_SOFT_RST_MASK,
>> +                          WCD934X_COMP_SOFT_RST_ENABLE);
>> +        snd_soc_component_update_bits(comp, comp_ctl0_reg,
>> +                          WCD934X_COMP_SOFT_RST_MASK,
>> +                          WCD934X_COMP_SOFT_RST_DISABLE);
>> +        snd_soc_component_update_bits(comp, rx_path_cfg0_reg,
>> +                          WCD934X_HPH_CMP_EN_MASK,
>> +                          WCD934X_HPH_CMP_ENABLE);
>> +        break;
>> +    case SND_SOC_DAPM_POST_PMD:
>> +        snd_soc_component_update_bits(comp, rx_path_cfg0_reg,
>> +                          WCD934X_HPH_CMP_EN_MASK,
>> +                          WCD934X_HPH_CMP_DISABLE);
>> +        snd_soc_component_update_bits(comp, comp_ctl0_reg,
>> +                          WCD934X_COMP_HALT_MASK,
>> +                          WCD934X_COMP_HALT);
>> +        snd_soc_component_update_bits(comp, comp_ctl0_reg,
>> +                          WCD934X_COMP_SOFT_RST_MASK,
>> +                          WCD934X_COMP_SOFT_RST_ENABLE);
>> +        snd_soc_component_update_bits(comp, comp_ctl0_reg,
>> +                          WCD934X_COMP_SOFT_RST_MASK,
>> +                          WCD934X_COMP_SOFT_RST_DISABLE);
>> +        snd_soc_component_update_bits(comp, comp_ctl0_reg,
>> +                          WCD934X_COMP_CLK_EN_MASK, 0x0);
>> +        snd_soc_component_update_bits(comp, comp_ctl0_reg,
>> +                          WCD934X_COMP_SOFT_RST_MASK, 0x0);
>> +        break;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int wcd934x_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
>> +                     struct snd_kcontrol *kc, int event)
>> +{
>> +    struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
>> +    int offset_val = 0;
>> +    u16 gain_reg, mix_reg;
>> +    int val = 0;
>> +
>> +    gain_reg = WCD934X_CDC_RX0_RX_VOL_MIX_CTL +
>> +                    (w->shift * WCD934X_RX_PATH_CTL_OFFSET);
>> +    mix_reg = WCD934X_CDC_RX0_RX_PATH_MIX_CTL +
>> +                    (w->shift * WCD934X_RX_PATH_CTL_OFFSET);
>> +
>> +    switch (event) {
>> +    case SND_SOC_DAPM_PRE_PMU:
>> +        /* Clk enable */
>> +        snd_soc_component_update_bits(comp, mix_reg,
>> +                          WCD934X_CDC_RX_MIX_CLK_EN_MASK,
>> +                          WCD934X_CDC_RX_MIX_CLK_ENABLE);
>> +        break;
>> +
>> +    case SND_SOC_DAPM_POST_PMU:
>> +        val = snd_soc_component_read32(comp, gain_reg);
>> +        val += offset_val;
>> +        snd_soc_component_write(comp, gain_reg, val);
>> +        break;
>> +    case SND_SOC_DAPM_POST_PMD:
>> +        break;
> 
> Redundant case?.
>> +    };
>> +
>> +    return 0;
>> +}
>> +
>> +static int wcd934x_codec_set_iir_gain(struct snd_soc_dapm_widget *w,
>> +                      struct snd_kcontrol *kcontrol, int event)
>> +{
>> +    struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
>> +    int reg = w->reg;
>> +
>> +    switch (event) {
>> +    case SND_SOC_DAPM_POST_PMU:
>> +        /* B1 GAIN */
>> +        snd_soc_component_write(comp, reg,
>> +                    snd_soc_component_read32(comp, reg));
>> +        /* B2 GAIN */
>> +        reg++;
>> +        snd_soc_component_write(comp, reg,
>> +                    snd_soc_component_read32(comp, reg));
>> +        /* B3 GAIN */
>> +        reg++;
>> +        snd_soc_component_write(comp, reg,
>> +                    snd_soc_component_read32(comp, reg));
>> +        /* B4 GAIN */
>> +        reg++;
>> +        snd_soc_component_write(comp, reg,
>> +                    snd_soc_component_read32(comp, reg));
>> +        /* B5 GAIN */
>> +        reg++;
>> +        snd_soc_component_write(comp, reg,
>> +                    snd_soc_component_read32(comp, reg));
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    return 0;
> 
> Missing newline before return - based on format of your other functions.
> 

I agree with you! I will fix such instances + other following 
suggestions in all the patches!


Thanks,
srini
>> +}
>> +
>> +static int wcd934x_codec_enable_main_path(struct snd_soc_dapm_widget *w,
>> +                      struct snd_kcontrol *kcontrol,
>> +                    int event)
>> +{
>> +    struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
>> +    u16 gain_reg;hd2_
>> +    u32 val;
>> +
>> +    gain_reg = WCD934X_CDC_RX0_RX_VOL_CTL + (w->shift *
>> +                         WCD934X_RX_PATH_CTL_OFFSET);
>> +
>> +    switch (event) {
>> +    case SND_SOC_DAPM_POST_PMU:
>> +        val = snd_soc_component_read32(comp, gain_reg);
>> +        snd_soc_component_write(comp, gain_reg, val);
>> +        break;
>> +    };
> 
> In the function above, "wcd934x_codec_set_iir_gain", you decided against 
> declaring local 'val' for storing _read32, though here, only for a 
> single use-case, you made a difference. Let's keep it consistent and run 
> with one or the other.
> 
> Also, is there any value for assigning gain_reg outside of switch-case?
> 
>> +
>> +    return 0;
>> +}
> 
>> +static int wcd934x_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
>> +                    struct snd_kcontrol *kcontrol,
>> +                    int event)
>> +{
>> +    struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
>> +
>> +    switch (event) {hd2_
>> +    case SND_SOC_DAPM_PRE_PMU:
>> +        break;
> 
> Redundant case.
> 
>> +    case SND_SOC_DAPM_POST_PMU:
>> +        /*
>> +         * 7ms sleep is required after PA is enabled as per
>> +         * HW requirement. If compander is disabled, then
>> +         * 20ms delay is needed.
>> +         */
>> +        usleep_range(20000, 20100);
>> +
>> +        snd_soc_component_update_bits(comp, WCD934X_HPH_L_TEST,
>> +                          WCD934X_HPH_OCP_DET_MASK,
>> +                          WCD934X_HPH_OCP_DET_ENABLE);
>> +        /* Remove Mute on primary path */
>> +        snd_soc_component_update_bits(comp, WCD934X_CDC_RX1_RX_PATH_CTL,
>> +                      WCD934X_RX_PATH_PGA_MUTE_EN_MASK,
>> +                      0);
>> +        /* Enable GM3 boost */
>> +        snd_soc_component_update_bits(comp, WCD934X_HPH_CNP_WG_CTL,
>> +                          WCD934X_HPH_GM3_BOOST_EN_MASK,
>> +                          WCD934X_HPH_GM3_BOOST_ENABLE);
>> +        /* Enable AutoChop timer at the end of power up */
>> +        snd_soc_component_update_bits(comp,
>> +                      WCD934X_HPH_NEW_INT_HPH_TIMER1,
>> +                      WCD934X_HPH_AUTOCHOP_TIMER_EN_MASK,
>> +                      WCD934X_HPH_AUTOCHOP_TIMER_ENABLE);
>> +        /* Remove mix path mute */
>> +        snd_soc_component_update_bits(comp,
>> +                WCD934X_CDC_RX1_RX_PATH_MIX_CTL,
>> +                WCD934X_CDC_RX_PGA_MUTE_EN_MASK, 0x00);
>> +        break;
>> +    case SND_SOC_DAPM_PRE_PMD:
>> +        /* Enable DSD Mute before PA disable */
>> +
>> +        snd_soc_component_update_bits(comp, WCD934X_HPH_L_TEST,
>> +                          WCD934X_HPH_OCP_DET_MASK,
>> +                          WCD934X_HPH_OCP_DET_DISABLE);
>> +        snd_soc_component_update_bits(comp, WCD934X_CDC_RX1_RX_PATH_CTL,
>> +                          WCD934X_RX_PATH_PGA_MUTE_EN_MASK,
>> +                          WCD934X_RX_PATH_PGA_MUTE_ENABLE);
>> +        snd_soc_component_update_bits(comp,
>> +                          WCD934X_CDC_RX1_RX_PATH_MIX_CTL,
>> +                          WCD934X_RX_PATH_PGA_MUTE_EN_MASK,
>> +                          WCD934X_RX_PATH_PGA_MUTE_ENABLE);
>> +        break;
>> +    case SND_SOC_DAPM_POST_PMD:
>> +        /*
>> +         * 5ms sleep is required after PA disable. If compander is
>> +         * disabled, then 20ms delay is needed after PA disable.
>> +         */
>> +            usleep_range(20000, 20100);
> 
> Superfluous identation.
> 
>> +        break;
>> +    };
>> +
>> +    return 0;
>> +}
>> +
>> +static int wcd934x_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
>> +                    struct snd_kcontrol *kcontrol,
>> +                    int event)
>> +{
>> +    struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
>> +
>> +    switch (event) {
>> +    case SND_SOC_DAPM_PRE_PMU:
>> +        break;
> 
> Redundant case.
> 
>> +    case SND_SOC_DAPM_POST_PMU:
>> +        /*
>> +         * 7ms sleep is required after PA is enabled as per
>> +         * HW requirement. If compander is disabled, then
>> +         * 20ms delay is needed.
>> +         */
>> +        usleep_range(20000, 20100);
> 
