Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A90F85AD86
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 23:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbfF2Vpr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 17:45:47 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:38268 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbfF2Vpr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 17:45:47 -0400
Received: by mail-qt1-f193.google.com with SMTP id n11so10429287qtl.5;
        Sat, 29 Jun 2019 14:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PydfWRx3VTHAN1rB2bk+LBoB6vW7pvGp02+1fwRJ1RE=;
        b=ooD/XQQOQhvoEjTcZV6/wWStcuJOHhQMYnlsHrJ+EZACNHEgB+ETmYQVB1+KkPL0mv
         +ZTWXmMYQ5LzQL2UNNw3atUoWU6DjrpOfQyyKTM20LU2WWtAyWtPW5H97uWBVF/0DOp8
         p5QIBlCQ4WYMWAz35A5rnFrUOWaiDuWgPErcAS/bepzjkfr9c12dlMStrP3HOWV2d064
         1VqsugQ4Ln8GmzJvaYBCvCCfmYUrY/Lt5yoJK0U9FOQ/nnADrqpcmdywc2e9nBGMFsKT
         oKZ9M2SQbYZh5hUBDoSrwIHqYHRkK7vxqTYr0LhO4ztn4mGmpeZFshB23SjG9t6F2J8E
         6G0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PydfWRx3VTHAN1rB2bk+LBoB6vW7pvGp02+1fwRJ1RE=;
        b=Q+txQT4l3rdGJlC9uEbLQy1lDjMqHoSpN24BNzCxYH6zamKDAXT0vOx8WfakHJOiF6
         PsQX3dbEaOjq+j59vpbHv8Ei34iZGPI+yxcVT55WREvbVgd3eZZCwuHOJNzvjbNveMYJ
         pSH4aHeEX/72cSPrBzFTzn6tjHzdBtod+kHyrRY/yB6eLL8CCKJG9UDiRJa/WLN+vZLe
         PNfymA+cMI5evWQ8m/zyVXlnsZbvngAxwhwnA8Waroz8SPslQRqyKnRtnwhUESiPDkjl
         LFe80Eda+KWGyeM0NK+r5vzNb9NpJQ1eTcYS9adhLoON21mZUxjnE3GW03gJgSWBOCfx
         AitQ==
X-Gm-Message-State: APjAAAWmspr7bnGsKbqikkWNXzifdo/R4IYiD8MGYJBn6UxKuCc+2Q2y
        v/hjqFTz4URHp/x+PBpZQowsbQRJ
X-Google-Smtp-Source: APXvYqxA4587hJlAfsh1OBgH3szPnO3jRvYdnE8AaoChTYYqPjyg0eVjEufh+AkrbjRBUIV36G6PTQ==
X-Received: by 2002:ac8:30a7:: with SMTP id v36mr13504603qta.119.1561844745818;
        Sat, 29 Jun 2019 14:45:45 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id k38sm3244931qtk.10.2019.06.29.14.45.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 14:45:45 -0700 (PDT)
Subject: Re: [PATCH V5 08/18] clk: tegra: Add suspend resume support for DFLL
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-9-git-send-email-skomatineni@nvidia.com>
 <594adc1e-4345-33ae-c79f-ad6f00964587@gmail.com>
Message-ID: <e641e95e-57e5-4654-c951-a3b63d3b37c4@gmail.com>
Date:   Sun, 30 Jun 2019 00:45:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <594adc1e-4345-33ae-c79f-ad6f00964587@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

29.06.2019 16:28, Dmitry Osipenko пишет:
> 28.06.2019 5:12, Sowjanya Komatineni пишет:
>> This patch creates APIs for supporting Tegra210 clock driver to
>> perform DFLL suspend and resume operation.
>>
>> During suspend, DFLL mode is saved and on resume Tegra210 clock driver
>> invokes DFLL resume API to re-initialize DFLL to enable target device
>> clock in open loop mode or closed loop mode.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  drivers/clk/tegra/clk-dfll.c | 78 ++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/tegra/clk-dfll.h |  2 ++
>>  2 files changed, 80 insertions(+)
>>
>> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
>> index f8688c2ddf1a..a1f37cf99b00 100644
>> --- a/drivers/clk/tegra/clk-dfll.c
>> +++ b/drivers/clk/tegra/clk-dfll.c
>> @@ -277,6 +277,7 @@ struct tegra_dfll {
>>  	unsigned long			dvco_rate_min;
>>  
>>  	enum dfll_ctrl_mode		mode;
>> +	enum dfll_ctrl_mode		resume_mode;
>>  	enum dfll_tune_range		tune_range;
>>  	struct dentry			*debugfs_dir;
>>  	struct clk_hw			dfll_clk_hw;
>> @@ -1864,6 +1865,83 @@ static int dfll_fetch_common_params(struct tegra_dfll *td)
>>  }
>>  
>>  /*
>> + * tegra_dfll_suspend
>> + * @pdev: DFLL instance
>> + *
>> + * dfll controls clock/voltage to other devices, including CPU. Therefore,
>> + * dfll driver pm suspend callback does not stop cl-dvfs operations.
>> + */
>> +void tegra_dfll_suspend(struct platform_device *pdev)
>> +{
>> +	struct tegra_dfll *td = dev_get_drvdata(&pdev->dev);
>> +
>> +	if (!td)
>> +		return;
>> +
>> +	if (td->mode <= DFLL_DISABLED)
>> +		return;
>> +
>> +	td->resume_mode = td->mode;
>> +	switch (td->mode) {
>> +	case DFLL_CLOSED_LOOP:
>> +		dfll_set_mode(td, DFLL_CLOSED_LOOP);
>> +		dfll_set_frequency_request(td, &td->last_req);
>> +
>> +		dfll_unlock(td);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>> +/**
>> + * tegra_dfll_resume - reprogram the DFLL after context-loss
>> + * @pdev: DFLL instance
>> + *
>> + * Re-initialize and enable target device clock in open loop mode. Called
>> + * directly from SoC clock resume syscore operation. Closed loop will be
>> + * re-entered in platform syscore ops as well after CPU clock source is
>> + * switched to DFLL in open loop.
>> + */
>> +void tegra_dfll_resume(struct platform_device *pdev, bool on_dfll)
>> +{
>> +	struct tegra_dfll *td = dev_get_drvdata(&pdev->dev);
>> +
>> +	if (!td)
>> +		return;
>> +
>> +	if (on_dfll) {
>> +		if (td->resume_mode == DFLL_CLOSED_LOOP)
>> +			dfll_lock(td);
>> +		td->resume_mode = DFLL_DISABLED;
>> +		return;
>> +	}
>> +
>> +	reset_control_deassert(td->dvco_rst);
>> +
>> +	pm_runtime_get(td->dev);
> 
> pm_runtime_get_sync()?
> 
> Otherwise looks like you're risking a lot here because pm_runtime_get() is an
> asynchronous request.

It looks like DFLL driver should be masked as IRQ-safe using pm_runtime_irq_safe()
and then the synchronous resume could be used..
