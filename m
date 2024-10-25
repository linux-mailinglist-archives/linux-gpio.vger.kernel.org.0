Return-Path: <linux-gpio+bounces-12116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 561DE9B0A47
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 18:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8C36283C3A
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 16:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA861DD0F7;
	Fri, 25 Oct 2024 16:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3QhoXPF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD09C170854;
	Fri, 25 Oct 2024 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729874984; cv=none; b=g3syCE2lwZdwFjevCBLkSp3bzLU0hbL5HgQXB1aOZeRqiICGcU94c1G6dO5jt2sDWmJIVP1I1MvOvXXQDSNrNq0ncG7Wb4Ee97Xe5TWrgQwP1sfJdK8ryooVh6pEdBrc0fQxtBEo9nH0HYQzS7e50rynieFzgRYTaR9qnkg7YYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729874984; c=relaxed/simple;
	bh=DfJ3hQmZ6k+K93BrEtTXX6xLP3W07BuCdIALQFrMA38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nk7esgihDIeKYjiMGJT4lLyk4mOnUZAMq6IQmQQSpkyk58awabVcLNwGQPcGgcQhJLaF/kIYlJX5G2FtBRBBwXzrFIkrlC7DmfyXc4FMFKMc7xiGnSqk0lw6fqcqm4rZ9jQBeZPgx67U+Z41PdEMT7TvjN0fZBYc0ReSpII6NtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3QhoXPF; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c9709c9b0cso3088405a12.1;
        Fri, 25 Oct 2024 09:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729874981; x=1730479781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C6NClCe/pCFahIjQkz67tW5BHdRGWDuFmSNfVYTs8HA=;
        b=E3QhoXPFD6MNXqedY5yr58z9FDqwGoR5DQr4nl1M2bb5botDw8LgV/EwqiSqIYzyWL
         6IOk6H8wxST5JWDC58XFRjV5FMrBqZUWMwAy0F+2r4F9Hfd6Tfok79Jb7UPGhfOUqN+2
         vlGG5PBUx70FbcJJpXOqgNxs+M4aR7gsvgv/YH3LnFuNMCNvQdLVwjQ6m092FwzXZvih
         1vtqprzbIDbXfs2WaGB90LDDqYgqO855TOXAFnix55a4xMu6maGhcrBNc63Fan0GLTrL
         1wwAuXJY11soyFXOxqhTdhsT3OmpSR2LDksH2dam0h0I4fjxdM9Z2/8w9j8kiTI+nZ0e
         MOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729874981; x=1730479781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C6NClCe/pCFahIjQkz67tW5BHdRGWDuFmSNfVYTs8HA=;
        b=e/dVSRsrLGQE5BRPK9byTxgSJc+gJXHwnMBrnNCYI9OYk4DHboapV9ltRnhvydBm8X
         YX1RVeSNExK7Ibe8Nxp3f7MbdqMonI7S9Ud6UBLA5Dw7SEfzPQbYh6g8Lm3+x2zjETAM
         EGLRPPvqmh91DbkoYgJdAp6MGgt+RQp6aKDYDkKfb/cD8GmZEncLheAbxIpVBYzoCKDF
         ehEYIDTDGUoa5+p/RdbmlQ71bd2H1FXkpzPXcilSJQoq30FZF5+dXOt/jaDk0Ih3xmcZ
         VD2TYxkEUUGe4NGMp7oHzBGoqqL6uVdj1k1siwwJXvcyzi4WFOk4fPvU0BsAqaQ1cdTk
         fPiA==
X-Forwarded-Encrypted: i=1; AJvYcCUHJpnJlVS/sXSs3RuAJcIEtzah6gBCUceNOWZgK398yxdCU9xphAj28X+DPD7tbeSA6xAGNsWCs55CPg==@vger.kernel.org, AJvYcCVVpPMfRZ4e7D9fJqQqsUqV/6KoiCluOJ2r3LiuiZL0ve8kuTHNNg7h338TRuTtofywSSm2oYLVBlfoxOGX@vger.kernel.org, AJvYcCVxQHNZb0DIpEDcrrDexUhkisKYO258j48D8w290AfmQfD/Zcm9BMI+IRr22tt6dUJKtv0pTSHa@vger.kernel.org, AJvYcCXUPe6fZE/a5bL94cV7N56OSRl0hUt3e9pMLCcKtPFCd4ptiWxqJT3qRUVWkeXfOJKtaQY3melExHfUlkZU@vger.kernel.org
X-Gm-Message-State: AOJu0YxxsPilslVPKac845j7N3lilPxtdJ0EGAgR2adFNm7k6DqFa9jN
	XykG/JikPKXEqEaNjayveRphG0Z9/EnqB8Skd/qWaKrmPrZD/g1y
X-Google-Smtp-Source: AGHT+IEplfKRE+FzdIgQzkRri+LLQy1SDGVkqAbCGUQXY94gamrjimYvOVLFEObF5gDcFC6jz/NVsA==
X-Received: by 2002:a17:907:72cb:b0:a9a:1918:c6c6 with SMTP id a640c23a62f3a-a9abf84ad47mr1057640966b.8.1729874980744;
        Fri, 25 Oct 2024 09:49:40 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f298b1esm88169266b.107.2024.10.25.09.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 09:49:40 -0700 (PDT)
Message-ID: <c153d278-7b61-4feb-a749-43226357acc3@gmail.com>
Date: Fri, 25 Oct 2024 18:49:38 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: spmi: fix debugfs drive strength
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anjelique Melendez <quic_amelende@quicinc.com>, stable@vger.kernel.org
References: <20241025121622.1496-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20241025121622.1496-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.10.2024 2:16 PM, Johan Hovold wrote:
> Commit 723e8462a4fe ("pinctrl: qcom: spmi-gpio: Fix the GPIO strength
> mapping") fixed a long-standing issue in the Qualcomm SPMI PMIC gpio
> driver which had the 'low' and 'high' drive strength settings switched
> but failed to update the debugfs interface which still gets this wrong.
> 
> Fix the debugfs code so that the exported values match the hardware
> settings.
> 
> Note that this probably means that most devicetrees that try to describe
> the firmware settings got this wrong if the settings were derived from
> debugfs. Before the above mentioned commit the settings would have
> actually matched the firmware settings even if they were described
> incorrectly, but now they are inverted.
> 
> Fixes: 723e8462a4fe ("pinctrl: qcom: spmi-gpio: Fix the GPIO strength mapping")
> Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
> Cc: Anjelique Melendez <quic_amelende@quicinc.com>
> Cc: stable@vger.kernel.org	# 3.19
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

