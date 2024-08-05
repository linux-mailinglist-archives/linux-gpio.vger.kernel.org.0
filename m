Return-Path: <linux-gpio+bounces-8565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6548C947467
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 06:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACFEE281176
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 04:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAF513D8B1;
	Mon,  5 Aug 2024 04:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="kvrSNWKs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0306AA3B;
	Mon,  5 Aug 2024 04:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722832739; cv=none; b=DXrDx9mcghHMvIOD2w2IEpZsl8VJK+jHu2zdBR/8T1SQhQuecKm8a7R2Ydh3m4NH9mHigT/HDZaog3Q3/LadxZ0pSrvDhPu7/ZSMTF6b2lH/lmWUIsg8gSPHC8BBgYlcglK7yiCwh/m1W+5oZ93UEh6aftGaysvYIws8BuaxwUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722832739; c=relaxed/simple;
	bh=m5B8eBctb/0DOWnVK4FFCB60GOrvBhoxfAb2JJG4BOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0ZtDYMr7t8ed9a1ALRJobGsawOUb/pT3Tn48Lv5I0dAZMdYNsruwgTkp1b5cHCkTlyOBc3ioWovAkWYJBjEqtML0jK8nhr7RU7rdGGWp7elGHPVrcTkc7LDsxxs5h9kRBGgXDG7fsYH0dXvsM9Ux/BQoPyXjBQP5DW7JtnUCdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=kvrSNWKs; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722832733; x=1723437533; i=wahrenst@gmx.net;
	bh=m5B8eBctb/0DOWnVK4FFCB60GOrvBhoxfAb2JJG4BOM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kvrSNWKs+lBoIs+vd+fVf8C57lSaHEhZ0cqY6Bnw27QYVhCoeLhQXs1orexunzOQ
	 vh12Ecf3dk/agnCSfejFx7dx8LheUvLEjnXPm3/AlnYGM91VVwmvVksE36iMUnsuJ
	 l2ClRImk/Q0YCgbQSCpaxkJIlunSH5GQ1vi4x5VYkI2OexrvSzTt+9Mpe/3fQGlQh
	 pebVIt53KvmWAvWhb9xMBeEV7MgRHwlfCXQwmkSE1iccP/SLZjoChzuvZbI96tj+K
	 oT7yr0unmyCRnF1UZLKpPyUWBIckOcx/uUwvsQ+GrfirTEl5yEGFFtw8WWvNtvflE
	 NqhYK0G7HLKlgxlU6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgvvJ-1s0vlw0oeb-00kfhx; Mon, 05
 Aug 2024 06:38:53 +0200
Message-ID: <38403ecc-bedb-46cb-bdda-2bed4c9c2d87@gmx.net>
Date: Mon, 5 Aug 2024 06:38:52 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: gpio-vf610: use u32 mask to handle 32 number
 gpios
To: haibo.chen@nxp.com, linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20240801093028.732338-1-haibo.chen@nxp.com>
 <20240801093028.732338-2-haibo.chen@nxp.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240801093028.732338-2-haibo.chen@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:I+pPo8jQg4sQIgWf8KUxJ1RB++X45NGtxrwFxT4dDlktUtv7v7C
 V6vTKykcYTrAGbvno+bp+uzCjKxmdjC7g5dqTdC/KJTkfldGhAttvxDcdKZOAE6D2F9jTq1
 kmqUTH8YmnfOYnhf2GjFBUfLC7oJ/GY/Hb4kAhb7xquW46mLQUjTWHceEpwDIl8qtbr5xMm
 PZKVj1+B+g5U6sYP+6vFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MUXGbjAVWsA=;cVvnS7Nw46yaQBg6z/D+2n3h/Iz
 nslhlqu2XL9OtcIe4DIW7gr9nVKHJC8Lpt8wqigZSHCHppge0CF38PWdW/MbcEJngMsFaNSPI
 E9hmaZvahfkTZkZ5W/GxLAgm48QoaIC48qNgEln2xIMl0tO+a5I2yAuFamzi4BfXLpdecLskx
 DmxNEDXtTxMOpLbGYKxWhlxN28implLh2n+tFEDfHMGQmMN8wh//KMsiRE5x1o1mxaxPfi2do
 CokfHXTBfkDJWYT6iS3PtNw6/O0Gv8cDBZOjCK6teBbKNvl9n32xy/Cp8bXigesL4R8vtR1qz
 jA9tHecafJdWi1VMV3ixe1Ommf4ExSEu7uLZFL62RSupTVWMUIQzH46ZnkRgZQ4zF45ZukU7h
 Hh6ubbYYY/XA7IKkws5lmKnfL0eam+Qxvih0sXINjsRLKJoUPy0ql5b0KLX0ghh2ww3jjVGEc
 H6nfvQ7qcpuE4BxJHK4SQdAVKbEi8xjxaNZAPcdF3zkyqgXYG26Hu6UKnpshEumB2ASmzctVy
 fvH/vbXT4rr/9LU/HHu39U17B1kMN6mcr+RTBI32DWBFuve/Viv5DYnkN/FKsDvoxbh0MW3Vg
 zDM4NnwfFcixFmJ4STqWGP1AUR0UjsVpvHmmTiHEXvFpg3CsUPv1xU+erAfikk5zbCAao6ts2
 Q/wn48+xn0hUvtXmOBIhsJZ/7uBYMjMsiprOxnksZzBNBloSSbZgUG0DaMuqgR+IHhydNOStw
 +j958qceB+/LP+a3nRWUgOb509QdYAmJ53D/VHJ6mJy7Ki5EEkttj7dCW4oqcvf5iSfMxyzGT
 LHm/6QBTDlq6L2wPI2zcwvUw==

Am 01.08.24 um 11:30 schrieb haibo.chen@nxp.com:
> From: Haibo Chen <haibo.chen@nxp.com>
>
> This gpio controller support up to 32 pins per port. And all the
> register width is 32 bit. So here use u32 to replace the original
> unsigned long.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

