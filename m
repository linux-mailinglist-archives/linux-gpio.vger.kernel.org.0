Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 994C96CBA49
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Mar 2023 11:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbjC1JQz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Mar 2023 05:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjC1JQx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2023 05:16:53 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97F35272
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2023 02:16:29 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id q16so14880051lfe.10
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2023 02:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679994985;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVwy6Dnb1d+DxS2wedB653Zz7EIqv+1P84qFWsC+sSs=;
        b=mDauaQS3w38Xc7B6Ss93Tz3UOLHXtwf60Xxh4cr4AR/0m7KoARwRsl9vVw2BbEBBtI
         p/fcDiIYyu7tbm+HKw4o6uSBNFrbxXVBm/sVe1KUsLgxeRRY957NSFNwrpo8lom4eqX7
         c1QQTNiiinOXq5VxUgKrKIs1x+oeMDH/Ny7oQUsH5JLykbp4zxn/DLJVq34qHa2yLyQu
         z16AeKmTs5SsMfYV+G0fvPqKUafXA5pKCpcyht78pBZbSFIHCEV/OE+lo3xxgJFMxJiw
         r3Pw3s+BpyV6pj41CwcSur2GC7u98gCr5UfPz/uqsyNCHH9x/vv/WG1sPw8rTGNSfqNy
         EtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679994985;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVwy6Dnb1d+DxS2wedB653Zz7EIqv+1P84qFWsC+sSs=;
        b=JcMlvwXkTH+6agXucTdDx/ao/vOw+CrXXfia3I5VNAK6opd2pcKfyQJmpNy/HaZikW
         dCNU6bs2/PVP2W9bIR9Ai2F+ATKYcTg3S5F+aSKLOklQNHZ2Y+SfLyvnFLQvRA9LaIJ7
         CEIofWd4Vvjx4GrJMQEcDFKOOXFBJ6tH2od/UlNh7laAz7d880pcAV24dUEd2B4jpODG
         BauPPU7x14KM6ejCTlfKB6Ekpbp73slV/VwxxrhJj6eZs1yWtXL442tRN9JGOIVUeEkc
         AvLqxHOiaS+NZjRnHb67rA9YdvPWA86/Ehs/vl9wWAs/gE29eK3YD5A9rtFi5uKsFs9T
         ClXw==
X-Gm-Message-State: AAQBX9eX8wMlnNQTaFA9fHx8UoNBFssTz5EH6s3AUbC9ppzKfjkfuK9G
        75bNWXUTB/2OJjK1pKVT/fJU2A==
X-Google-Smtp-Source: AKy350bdf1KNzCyrReTbNqKzhAVBsSk6fMUzecRQMv7NRU6ovRmnLiWyq4XiEyJNsSJUC2nFSeuvnw==
X-Received: by 2002:ac2:5551:0:b0:4dd:cef0:c27c with SMTP id l17-20020ac25551000000b004ddcef0c27cmr3951959lfk.33.1679994985154;
        Tue, 28 Mar 2023 02:16:25 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651211c800b004db0a7ce483sm4973167lfr.162.2023.03.28.02.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 02:16:24 -0700 (PDT)
Message-ID: <b3630bb5-a2a9-6f38-c70a-eb4b8ea1630d@linaro.org>
Date:   Tue, 28 Mar 2023 11:16:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 15/18] arm64: dts: qcom: sa8775p-ride: set
 gpio-line-names for PMIC GPIOs
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230327125316.210812-1-brgl@bgdev.pl>
 <20230327125316.210812-16-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230327125316.210812-16-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 27.03.2023 14:53, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Set line names for GPIO lines exposed by PMICs on sa8775p-ride.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 51 +++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index b7ee4cc676b5..a0d2024a69df 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -32,6 +32,57 @@ &i2c18 {
>  	status = "okay";
>  };
>  
> +&pmm8654au_0_gpios {
> +	gpio-line-names = "DS_EN",
> +			  "POFF_COMPLETE",
> +			  "UFS0_VER_ID",
> +			  "FAST_POFF",
> +			  "DBU1_PON_DONE",
> +			  "AOSS_SLEEP",
> +			  "CAM_DES0_EN",
> +			  "CAM_DES1_EN",
> +			  "CAM_DES2_EN",
> +			  "CAM_DES3_EN",
> +			  "UEFI",
> +			  "ANALOG_PON_OPT";
> +};
> +
> +&pmm8654au_1_gpios {
> +	gpio-line-names = "PMIC_C_ID0",
> +			  "PMIC_C_ID1",
> +			  "UFS1_VER_ID",
> +			  "IPA_PWR",
> +			  "",
> +			  "WLAN_DBU4_EN",
> +			  "WLAN_EN",
> +			  "BT_EN",
> +			  "USB2_PWR_EN",
> +			  "USB2_FAULT";
> +};
> +
> +&pmm8654au_2_gpios {
> +	gpio-line-names = "PMIC_E_ID0",
> +			  "PMIC_E_ID1",
> +			  "USB0_PWR_EN",
> +			  "USB0_FAULT",
> +			  "SENSOR_IRQ_1",
> +			  "SENSOR_IRQ_2",
> +			  "SENSOR_RST",
> +			  "SGMIIO0_RST",
> +			  "SGMIIO1_RST",
> +			  "USB1_PWR_ENABLE",
> +			  "USB1_FAULT",
> +			  "VMON_SPX8";
> +};
> +
> +&pmm8654au_3_gpios {
> +	gpio-line-names = "PMIC_G_ID0",
> +			  "PMIC_G_ID1",
> +			  "GNSS_RST",
> +			  "GNSS_EN",
> +			  "GNSS_BOOT_MODE";
> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };
