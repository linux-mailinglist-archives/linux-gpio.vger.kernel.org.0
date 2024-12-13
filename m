Return-Path: <linux-gpio+bounces-13859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 413449F0C0C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 13:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09376167FD5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 12:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CF41DF753;
	Fri, 13 Dec 2024 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ni0HVaNs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74611DF746;
	Fri, 13 Dec 2024 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734092174; cv=none; b=GktsVNZuBS8WpNUwaYtsfEz3/ZnrspdEtuz9eTXdaawVb93Sensx+5VA4fmxDtWW6tADfmThkx2+LebxrvZSCkn3zKF0BTou4YznuCxrIVNqDcrvPU00s/aN2kI614bdYLmhiWTG0/VnARlvBCBPAhAVELZp+Td6KvGr9JExxjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734092174; c=relaxed/simple;
	bh=/xIPSZ/ZziO1VRaqjEyqpq0lSR/bhSq3vfO1oqrKSAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JrEGCUVT0Wn2Ax6gYSoH9uVvxZfkov0zaFM0RE0fOicTtjNitkwYa6ag5//iHSHK7YyhRmpUF4RY/8JA27FjtIGewzlN5nU5eQ1af9qsfoefduHjotrjFw2fPWcSMGG7548b/ULea/HvKOGNYj7yJ2dtoAXJ6XC5qiq/WKKSIsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ni0HVaNs; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30229d5b1caso15401951fa.2;
        Fri, 13 Dec 2024 04:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734092171; x=1734696971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WEzviB/INGBNIIppsw7fK4odS8Wp1IEwVFWkXeaDax4=;
        b=Ni0HVaNsZxWH12uEuD/88YxOPFXCqYIUlmKPRDmLz6K+p1XI4sOhJvZRpuRVA/wf94
         IMgkTwhi7TpRGesHCAdQGucx5Zj3gjV74hlllgSvevURG0f7h/AWHSFw1bXkjGNDPApM
         cbTe/D3Uj6zu9e2DmmN+HIIoyqAvvqOgyfKa8Be0iplMoVq68sMhyD7ZoZJP3BKLQqbC
         1xKrR0diEAIBvVjORdtYQw/hMOuZQcw1ZFSgMFsueAD3PBTupHA+BfBm45gTgtJAG5rO
         itfxH/5IAkpcGqQpCKFuHPMHmSVX8mkoUms3b0Iqaapl5fbYd4zc8sFdgGTMEIezUVfH
         UwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734092171; x=1734696971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WEzviB/INGBNIIppsw7fK4odS8Wp1IEwVFWkXeaDax4=;
        b=I85BgNiSJKWz/DiY4nqgIiLqqcwMGe5etnag8D8QMtoHZaJ3cLKFp5y0FiEjWf5LiU
         8MLCV5SrfakIiE4UYzB43bm5HE4acYKVlanLRA/V6qGGIv7PEL4T9lmTgmyVB5OrClLb
         qSJVabyKdxvbKja4MIcNAJlf12Xlax35WSjnT75K1wGHRt67lPEIwrXkZ7FIqs6Qiwkr
         B+LwrgwMZ/b/UuxUWbIiZLlgKLgYatYH9jjicUo7cyy+5lIqODH7nJX5brFd7pQuGrmC
         1AcrfBhxQrfvvzqAbyGL0ldgMgkyT9kRP879HksCTxXxOMlRbwzvK2cowufxiEKE/Vsa
         3/9A==
X-Forwarded-Encrypted: i=1; AJvYcCW7pKHFgInRCC+3LJF4HmsZd38bAPh4T2muuJIrlopKprcKKag1fWEl2coy/o+p9Z6UeYT24y/PtFvINr8=@vger.kernel.org, AJvYcCWnZis08F7nu3cPRoDj5Cos+nUFxzOH9LgCzW/DTzaYkMu9Baetn7LlyKdSePVtSncsELX4R5q1BkRvMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+FbLl6JOneqKIrBDbHrL8dLcmt5iiBNRHivAkE+looC3qmQt2
	9ygCnvAvBe1ymCX/pX9iM7DgtnLvUSzSsI+2ykT0sloafLw2vZX1
X-Gm-Gg: ASbGncvOQerjux6octZkRZKZNIqNNCIPFlcGM8LM0IgzEV5Y2afRfBDcN4NxLQhfRZU
	ReMrxYrl4TyRZaYG8PLlLy5fcUsJU1FPkWyqmsJXVuBcapPy09ga/ilBpKwnom4wNFzoAfc7Hso
	otFcIh9jS+9DOZ+8FthYDYC44vdbAs25+DmoZf+pUtX3AmI+9ENG35F+AOjBVLm/ZZYh0/xMuvG
	2VifNcEB+RPJs8I7q2n0dyHk3146PuJdwlVGLnbzWHGz5HLmdMghdrYhywEvDPFWyXj9Q==
X-Google-Smtp-Source: AGHT+IG9wmR1HdLUIscxgI933hBHpEJdVTgSh7mkcbgYu9IHF6Bn9g6wfE9etzLi1BXmv851ierEKA==
X-Received: by 2002:a05:6512:1114:b0:53e:391c:e983 with SMTP id 2adb3069b0e04-5408ad81d0cmr729141e87.3.1734092170743;
        Fri, 13 Dec 2024 04:16:10 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54020269fdasm1518740e87.182.2024.12.13.04.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 04:16:09 -0800 (PST)
Message-ID: <a21531a7-13ae-45f5-a60d-dd80b3ef9834@gmail.com>
Date: Fri, 13 Dec 2024 14:16:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpio: omap: save two lines by using
 devm_clk_get_prepared()
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Tony Lindgren <tony@atomide.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20241203164143.29852-1-brgl@bgdev.pl>
 <20241203164143.29852-2-brgl@bgdev.pl>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20241203164143.29852-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi deeeee Ho peeps!

On 03/12/2024 18:41, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We can drop the else branch if we get the clock already prepared using
> the relevant helper.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Booting a beaglebone black with the linux-next from Today fails 
(next-20241213). Enabling earlycon + debug yields below splat to be 
printed to the console:

[    2.628019] ------------[ cut here ]------------
[    2.632793] WARNING: CPU: 0 PID: 34 at drivers/clk/clk.c:1254 
clk_core_enable+0xb4/0x1b0
[    2.641156] Enabling unprepared l4-wkup-clkctrl:0008:18
[    2.646530] Modules linked in:
[    2.649688] CPU: 0 UID: 0 PID: 34 Comm: kworker/u4:3 Not tainted 
6.13.0-rc2-next-20241213-00002-gf2d4b29c8330 #15
[    2.660256] Hardware name: Generic AM33XX (Flattened Device Tree)
[    2.666531] Workqueue: events_unbound deferred_probe_work_func
[    2.672553] Call trace:
[    2.672570]  unwind_backtrace from show_stack+0x10/0x14
[    2.680578]  show_stack from dump_stack_lvl+0x50/0x64
[  7 2.685788]  dump_stack_lvl from __warn+0xc0/0x130
[    2.690734]  __warn from warn_slowpath_fmt+0x80/0x1a0
[    2.695944]  warn_slowpath_fmt from clk_core_enable+0xb4/0x1b0
[    2.701963]  clk_core_enable from clk_core_enable_lock+0x18/0x2c
[    2.708159]  clk_core_enable_lock from 
sysc_enable_opt_clocks.part.9+0x28/0x84
[    2.715611]  sysc_enable_opt_clocks.part.9 from 
sysc_enable_module+0x254/0x2dc
[    2.723052]  sysc_enable_module from sysc_runtime_resume+0x17c/0x1c0
[    2.729599]  sysc_runtime_resume from __rpm_callback+0x4c/0x130
[    2.735709]  __rpm_callback from rpm_callback+0x50/0x54
[    2.741096]  rpm_callback from rpm_resume+0x614/0x660
[    2.746304]  rpm_resume from __pm_runtime_resume+0x4c/0x64
[    2.751960]  __pm_runtime_resume from __device_attach+0xd0/0x188
[    2.758155]  __device_attach from bus_probe_device+0x88/0x8c
or_thread from kthread+0x188/0x24c
[    2.789476]  kthread from ret_from_fork+0x14/0x20
[    2.794327] Exception stack(0xe0091fb0 to 0xe0091ff8)
[    2.799528] 1fa0:                                     00000000 
00000000 00000000 00000000
[    2.807947] 1fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[    2.816365] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.823173] ---[ end trace 0000000000000000 ]---
[    2.828070] ti-sysc 44e07000.target-module: Optional clocks failed 
for enable: -108
[    2.835998] ------------[ cut here ]------------

reverting
b7bbaff8c1bc ("gpio: omap: save two lines by using devm_clk_get_prepared()")

fixes the boot for me.


>   drivers/gpio/gpio-omap.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index 54c4bfdccf568..57d299d5d0b16 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -1449,13 +1449,11 @@ static int omap_gpio_probe(struct platform_device *pdev)
>   	}
>   
>   	if (bank->dbck_flag) {
> -		bank->dbck = devm_clk_get(dev, "dbclk");
> +		bank->dbck = devm_clk_get_prepared(dev, "dbclk");
>   		if (IS_ERR(bank->dbck)) {
>   			dev_err(dev,
>   				"Could not get gpio dbck. Disable debounce\n");
>   			bank->dbck_flag = false;
> -		} else {
> -			clk_prepare(bank->dbck);
>   		}
>   	}
>   

I can only spot a minor functional change. The code prior this commit 
does not check the result of clk_prepare(), and does neither set 
bank->dbck_flag = false; nor call clk_put();

Other than that, timing is likely to be changed. Not sure what is the 
thing here.

Yours,
	-- Matti





