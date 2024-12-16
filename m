Return-Path: <linux-gpio+bounces-13910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DE29F2EED
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 12:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4886A1651CB
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 11:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0316A2040B0;
	Mon, 16 Dec 2024 11:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cb7piB5+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24956203D4C;
	Mon, 16 Dec 2024 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734347692; cv=none; b=GW0sgNReHaIaEmhrR0GBVFGfJTZ983HNVVQzWiqtTiVhy9YDPS97b+kMak5FgWoRx8vJFw1j2pK8g27F107ck6S2K4byIzPdQfFJ7WrG0co79OPwO/5Ft/enHvqoyQzlLoe5X3oE5zCnDwC8jtkHIU6rBzapfgIkmRt/+r6Xgpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734347692; c=relaxed/simple;
	bh=Jw+e3i57CSkuSORIKHnE/C6YFYtdyjbji+9oIZ/8QH4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RUb3SnLC4gXPFXkuMb7M0l1WTcTGelOh2hF7Z2YDYG5+KS1D/ie0chzhNalwEqaQzHKw+569KCtTIpjjaNFkNXXFxIQaOUHH2C9qqHvfH0fKFgS62JiRqA2nqsWKMx6GCwTyweGPnV7mTkcdNvYYR2RkQEGwgDDRu8hX9ffLDFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cb7piB5+; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401c68b89eso4344058e87.0;
        Mon, 16 Dec 2024 03:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734347689; x=1734952489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j6cyR+MlTqQdIWJhxPssDFa0/agw/aN1MfdhTEcS8o8=;
        b=Cb7piB5+cpukFQEQirb7YWJYOgFzIII6UzXpDh/2DWZ/KWOQL4FlbtPreDcMrEZjZm
         76Gg/l303u2DtJZsOpKkd/+qXjq8M5SXVB8z9Y1vZ7a5RF6Dr887fZzUBu+0oxSoCybT
         Jh+yao80H9Q8iCJsZhSfFGc4uz+TK09rks39IsMIS51xxmafobCmNfkkd8dILl71VJiP
         EQZelovdKyXLxWaV8cJTLtfM5iYGb+XGhnSRzPdtC7CkN6nkCyq6+fMjIwTr6aQ4Xv4I
         ErB15cCODOfIrK8JhvJbTLHSFpDi9sCZYT/1hdrT52JEuf3kRU1QyI7DzgxSOqCmgwjs
         eqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734347689; x=1734952489;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j6cyR+MlTqQdIWJhxPssDFa0/agw/aN1MfdhTEcS8o8=;
        b=qcEEMlSVnjIFq7JOS6V/iWepIaZRQJkIbMZJp+z7vDEOGuVpcN16ch6e6vUFRKxiyG
         CVYGcbvidGJZU92xbxZLeYX6Yt9MvzbEMSASAycELbnPm2kN/4mOhyZq+BwwNG1wMXP6
         8gXC4s0rMcQFYdRLMC3JdkTlZe5GZohE7BnxpbVH1zGCXiv6l4Zk2ejfA3xghts9v1b0
         7ChCELVwvanS5Jx1BZowdPk2ieJKhTb9iLHRUEVrkVQ4WPKXhFvofPw8DeWS8Hnd42gL
         tXcHcY6yDZ5G1QyC67Ld72Vi1O8DLXeHSSLOQ1vrNnYuq9lKuioGA2M/xRb+JfzEQn7F
         XRWw==
X-Forwarded-Encrypted: i=1; AJvYcCVh9j/tQ6eIhgdWCUjmDc2g+VUF0mVfn3B8vKfD685gFIPVsJfQMosGcBsP+X3ahCEBMfz6T1EoNEmgDHAu@vger.kernel.org, AJvYcCVi7aJ3CqF47eyvZ0aSf6zAivFVlWs2ZvTC8aE02EsOd9tEySY/yfq0fBB2Cm/3/vjTRn1+kPftOlNpAw==@vger.kernel.org, AJvYcCVopuEuWToKTdjupNTwI7+T03vKLTLHchasYlQJm25Les+rZKT+spjChQHoLhMhDjYgUfuC9FWeTEsV@vger.kernel.org
X-Gm-Message-State: AOJu0YywnpgvIq2hmEvL75IUrkDAM1ssc9pqcDnXqCBv+J67eONdDaHv
	XBKq9QsDr5p1nQWw/nQ90hMl2GRKkH5wb7Gzy3LojDo1VSrna/ER
X-Gm-Gg: ASbGnctTapbcLz5ylCVwC32rBg1TrzpxDFRyzmPwMSUfALmsvvLsv0Mvpkx3rxdKkOA
	GN6oPPZk6sh4m+G/Qk6GYno6ddtAQrwbYDlYTYFnbo2Wb5Bg7uxHTiPEaLTlYYubAavwhY68lJY
	YPyI/g8BKOuiJ59475vRJ5oSVBtQZ7C9WHngkm2pR+Ru8UKQuOONxfCCxyaBBfd2AgnuBMrPLbD
	VfOzPoNWbBFJD0WwKGgSaW1ZdzFYsmzDXbNgOAWcW4KQEe+64GIvt1fBa0wIBlmh/6hYA==
X-Google-Smtp-Source: AGHT+IFd/JaEC1I2zR0HAVQ4D1BBdQ51AmhXAWDU8e5jdd/JnIX+N08WoOVOAt+sOlURrAnSpwsBYw==
X-Received: by 2002:a05:6512:b84:b0:540:1b4a:9177 with SMTP id 2adb3069b0e04-54034271ff2mr4533327e87.22.1734347689124;
        Mon, 16 Dec 2024 03:14:49 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c20b19sm805071e87.265.2024.12.16.03.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 03:14:48 -0800 (PST)
Message-ID: <f7c3effb-a7e1-4a24-ac7e-f84e49eefb80@gmail.com>
Date: Mon, 16 Dec 2024 13:14:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpio: omap: save two lines by using
 devm_clk_get_prepared()
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
 "brgl@bgdev.pl" <brgl@bgdev.pl>
Cc: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <20241203164143.29852-1-brgl@bgdev.pl>
 <20241203164143.29852-2-brgl@bgdev.pl>
 <a21531a7-13ae-45f5-a60d-dd80b3ef9834@gmail.com>
 <0bf97a477f1c547b960c63607395b82d92986ef3.camel@siemens.com>
 <a175fd56-c21b-46f5-bd0a-ccaa7c0f3efa@gmail.com>
 <828da89cff6dd2c49df9af6131aa3b43675abc87.camel@siemens.com>
 <72c52d8a-b0f2-4767-9e8c-ce869d203d0b@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
In-Reply-To: <72c52d8a-b0f2-4767-9e8c-ce869d203d0b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/12/2024 13:11, Matti Vaittinen wrote:
> On 16/12/2024 10:57, Sverdlin, Alexander wrote:
...

> This fixes the boot as you assumed.
> I suppose this should be baked in the Bartosz's original patch assumed 
> it was dropped from the GPIO tree.
> 
> Furthermore, this seems to be a fix to a hidden problem on original 
> code.

Just a minor clarification:
"Original code" here refers to the code before the
"gpio: omap: save two lines by using devm_clk_get_prepared()"

> If the original code failed in the clk_prepare() and then deferred 
> probe(), this same problem should have appeared, right?
> 
> Maybe consider using Fixes - tag even if this and the original change 
> got squashed. Feel free to add a:

Yours,
	-- Matti

