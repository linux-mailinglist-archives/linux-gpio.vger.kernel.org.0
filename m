Return-Path: <linux-gpio+bounces-19590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E16AA8BDD
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 07:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4493317164A
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 05:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DE51A8F9A;
	Mon,  5 May 2025 05:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJWIxpRQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6204AEBE;
	Mon,  5 May 2025 05:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746424479; cv=none; b=ZeOl1xCWtaO50RpZLil+TInW2bf+wvzVNj7M0ACcarvFA9c2jKQNes5XDqQz4H8hINUNNsdCCfVDZmHiseevQeGP7Wx32i3uv+wDdm5+cC24ZZ562xrCjvCGmXma8SFzlez/BhK7BeAWJIEk2HaY4Lc2maKhJEGrH/YXdy0J7X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746424479; c=relaxed/simple;
	bh=JNhDULvhn4HOLlSr9x6YtX6MGI6nzOi9XQ4X+JR8FDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AcVr1qGnPZxKy7kA9FibQEoXw/axpRSX8yrrihPDROGnb9Ui8xQi2DM72quI36ZDlxlgiKQOvr1ZqTczRg8i4jOwhTUewEYgdx2/vDQOxARy4tdT5VfuvYr8d60Wo6rnvuClPXu4ZrvyPegL4ywSxt5Jb7EqHer7sZP7dLOv/gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJWIxpRQ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54d65cb6e8aso5175707e87.1;
        Sun, 04 May 2025 22:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746424475; x=1747029275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v41UzD7X2NmBLMS2a6rtXUz59TrgAWuFJrBADKI9liE=;
        b=RJWIxpRQuFjEoL1Rh0d0q1W+qJ+XZGbVzHOGFywMFHmUClI9vwoimVyd0gFTon7Rnx
         KC/3S/rj9TOg2pY40smyqQw/78HXPxVhaZdlr4UtWocHy2BWI0KWqY47DLNQE3Tqw8ZB
         As17A5ug31Apuqu3eA7jJlkMBB2N/Mua2UjGi7eHGeLBEJFRhlMyMKWWso09nx84L3cG
         EnL5AklfZzBOsWrGJJPr4iBHJVwWFOCCubTfeOuYPVxig1bkdHWli5OM3uoP1PoXpnLL
         cGvfzXyX5m7gaOrVhReVwBPPqUyMPsGCcNZQ/VeD5c/YMQe196Nhp+alJkIqQoqGBt6p
         UsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746424475; x=1747029275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v41UzD7X2NmBLMS2a6rtXUz59TrgAWuFJrBADKI9liE=;
        b=YdFnm4OCKymptKUyyGZo2wsq2B1uGceX1FwLjRrA9UOtDJrZJQys7puU39gT45tfTd
         ZA3wXpX1dIRX+l4yRVSdKA682rou8gOk+WdYnk2vT1Fb1hL5Ro4Gzf6HD11S+bWCe5hw
         RdxgcIgekEj+p0+cM+P0+rcD2Qij8MKOcnNTHxgGrH5BfqTr2CIPnZrNXXJ4XFY9fGR0
         WHCt2RuTGPXO7hQJiQhErrqT0V0TnKDCmUC9tP7KiZye3rIXNPetFx6WixSHy2S7NP7A
         wuYex1QrjnNb3TjOarZH417VRvI2/wQAB6ApVy+RbC47sYsnQewMVCMi3PfHc2bxlGfG
         MxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvK8LBM0cKvVr34o+bkm+OVIzjMLX1TcbWd35iloTKpZ9NAh8XuZRJUG9A/nfpPya2PvP/sSOVL5BU@vger.kernel.org, AJvYcCX1x2rSMhsx/bBUJCio4eLajMiJH/6JJgDIO1XIdB6i2WvUacE6rkCm9ZsRGLa8pv/kOhYuPVHI2ILrGBkQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ZS+iYlNttCJoP/IKaD7BoIa0gMHNQJ7xPbTFg31a7w/K3LDs
	1GorEUZLcyOEwNNIpmuSiWv6KuSOOCK0hp4j2jEY2uZqTaiYDnqz9mCGcA==
X-Gm-Gg: ASbGncuqkJTXcyvSeUkCrDL0UpVfJcejTolhxK5LDLmYVmZ/b0R4b7vzQjPcKWB0cBm
	+HHSDMFGTrSZFlGFz9r5VzQ4vnEfJPIVxvT2NJKiR9wYr2YL5ZPkV0MKEOAMyq+qaDvOKXo5CWm
	mSNFT9I1xsMmefAfkgfyAyc6hnGObCpuEc32/FX4eYdo37VkiFqcQAn7EwfgdTxZBVoKChomW5s
	wo1vEhNEcZR6Vbir9nwoYNQ46fFLnk1Z/CU1uMlHFQco3Qwsp5wLRA7GkTLlmmWC4xTbsp/IQys
	FTAQdVb8DT6IIuRjWjol9Gv7kDIqknLYe2FDWy7ZGbd2xrNbyZvH5W4XMilez+Se47KlU58CMTm
	c8lxtGj7k3kTLpfXCc+b5Cw==
X-Google-Smtp-Source: AGHT+IFlzjo2ymbBjO9DidiEJ2qkM8M7MJZlHw2O/AGlyoxxDugUkv/aBtOTyBWKTezqkj2cm5NfpA==
X-Received: by 2002:a05:6512:3088:b0:54e:86f3:5e54 with SMTP id 2adb3069b0e04-54eb2418fa2mr1896454e87.5.1746424475060;
        Sun, 04 May 2025 22:54:35 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee054sm1587952e87.149.2025.05.04.22.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 22:54:34 -0700 (PDT)
Message-ID: <baea6673-b48d-4544-9c6b-5f64d8e76603@gmail.com>
Date: Mon, 5 May 2025 08:54:32 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] pinctrl: qcom: switch to devm_gpiochip_add_data()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Guenter Roeck
 <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Doug Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-3-da9b7f6408f4@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250503-pinctrl-msm-fix-v1-3-da9b7f6408f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/05/2025 08:32, Dmitry Baryshkov wrote:
> In order to simplify cleanup actions, use devres-enabled version of
> gpiochip_add_data().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/pinctrl/qcom/pinctrl-msm.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 88dd462516c76d58b43d49accbddeea38af8f1ec..b2e8f7b3f3e3d5d232b2bd60e5cace62b21ffb03 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1449,7 +1449,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>   	girq->handler = handle_bad_irq;
>   	girq->parents[0] = pctrl->irq;
>   
> -	ret = gpiochip_add_data(&pctrl->chip, pctrl);
> +	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
>   	if (ret) {
>   		dev_err(pctrl->dev, "Failed register gpiochip\n");
>   		return ret;
> @@ -1470,7 +1470,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>   			dev_name(pctrl->dev), 0, 0, chip->ngpio);
>   		if (ret) {
>   			dev_err(pctrl->dev, "Failed to add pin range\n");
> -			gpiochip_remove(&pctrl->chip);
>   			return ret;
>   		}
>   	}
> @@ -1608,9 +1607,6 @@ EXPORT_SYMBOL(msm_pinctrl_probe);
>   
>   void msm_pinctrl_remove(struct platform_device *pdev)
>   {
> -	struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
> -
> -	gpiochip_remove(&pctrl->chip);
>   }
>   EXPORT_SYMBOL(msm_pinctrl_remove);

I suppose this should also make the time window when the GPIO chip has 
gone, but pinmux is still there (to call the 'gpiochip_line_is_valid()') 
smaller.

FWIW:
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti

