Return-Path: <linux-gpio+bounces-3756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC741867346
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 12:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 873E6285E50
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 11:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3A7200DB;
	Mon, 26 Feb 2024 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VzbbdnIW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B344F61C
	for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947339; cv=none; b=rnCH6tkHGPPjRVYEA+orQC9QwN5s22ZBupK0JEC9jFvyC7Am803VqZBPD2EUtlUoBB0E+3WYQ3p4toTslI3aikT7keM+Vde2K2rFVD2nCiREpCb3zL8JGjvuadSM02FhkZCAZk/7K4o6il6W/KE/Zk6pea2/hVR/5KETs/5+ego=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947339; c=relaxed/simple;
	bh=i/hdAmu6t1Ml+j/U/nDxql1yoCVssf5P3sS4Em+sWm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ByLa8gBDvnIRV8g2zb9I3v+I3SWnZjLMxrN362+PjtJsTTHOuSk+c1Fnxe0mcPjYn/2cgit+hmuCZqfYaFr794FgvLwJpr4HnOSEwYaA63YToVA8ye/63Y5dGRqrQSigtgBW3IpXjCgsztjn+lrtWs2IGDt5B8dfI5qRcz+uMcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VzbbdnIW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512bd533be0so3416582e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 03:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708947331; x=1709552131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+PDmnMcx2E4H6tTbbAzzJaam4Tww5sulGgIzBdFP5s=;
        b=VzbbdnIWLXxKyDFlHPrQ5UPlig8l0FfxWVLGoDNL9E7L5kDriIKWFjOrvATeGXAk62
         FOJFlOHB0TwZCRM1gUASn7JbCfXUkKlb1tLiC2KXPo2jBN/eO/D8C6BSCG358hME6/g0
         R55ZgJD5z5bbcyGTxK/9orLHHhM3KbPytCtfvbdxa9LhRFbPEbatK38TyzdcYjaLYhUX
         hUQ8ivnrYR7RPyYS4oCQajeg+Pc8z/cxt5Q9dOR/NIMH0p6rip/NLtL7kfjEPD+ShJFR
         4L/ysRKhFDAKJCGF8tdAKE9WYcpNPShEI4DQJBrNIjnI9DCZa5i68ppyBJYXlIc81j/a
         KRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947331; x=1709552131;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+PDmnMcx2E4H6tTbbAzzJaam4Tww5sulGgIzBdFP5s=;
        b=eQRCL2hCM/lf8GSCcX9BH0bMljfGxV6ZWYl1GPR30+s36PeBYA8URj/Vv4rxe5StlJ
         Oo5jTOv+2vNBLPLIj3A8DHmwLNdTDRQYNoxd/7mCU5iqmoTtegFNc9aPUbgny6+38tWE
         95uoP/sI3aT9M4ovY6/Se/uw1Ee4w4BD0XJwo5e0zMBEptAnBG43w2YLGgtlfKZ5Y/Ab
         OOF8c7DR1briDhtcRuRWRRoBRN4uXA80YtG9NUSNzuqsJLliy2DD+L16cJ7cy/5JxsJw
         do2hMBIuSHhIyqTV3eFg5Pn/cGYRGg0pdE0terGLxbUDf7kckzVQ8dUStzYuxFjNR8+m
         S+Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUJHNOELxHZd5TK9kcaLOivX7JdGhRKFkFloKKlNeJOsArhI0BTPw3t7FAlu2SlNPgaAW1/1J/eqPMJ4PtOVdCk+3sgw2VaP2IBiA==
X-Gm-Message-State: AOJu0YxzhjGUkae5rKL/HpjP/+GRB8P0GLQ4K7faWtsuuScU+st1C9J5
	epz/RRYQ0ak1QgZercPZKyFdPctQaV6wSAoN7DQGcLx7PutQB3d5vrO+1/FsL6Q=
X-Google-Smtp-Source: AGHT+IG6hBua31Lkk7zG5j8gnRUqY7L6TmjRI6k1IFOXz0KJbTMk57PONrIyMZ+B6NNW1gG8CniM8A==
X-Received: by 2002:a05:6512:2c91:b0:512:b438:baba with SMTP id dw17-20020a0565122c9100b00512b438babamr5068882lfb.28.1708947330556;
        Mon, 26 Feb 2024 03:35:30 -0800 (PST)
Received: from [192.168.1.70] ([84.102.31.43])
        by smtp.gmail.com with ESMTPSA id y1-20020a05600c20c100b00411a595d56bsm7842964wmm.14.2024.02.26.03.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 03:35:30 -0800 (PST)
Message-ID: <2d589f9d-d60f-4fb4-aca9-697798b52ab8@baylibre.com>
Date: Mon, 26 Feb 2024 12:35:28 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] mfd: tps6594: add regmap config in match data
Content-Language: en-US
To: Bhargav Raviprakash <bhargav.r@ltts.com>, linux-kernel@vger.kernel.org
Cc: m.nirmaladevi@ltts.com, lee@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, nm@ti.com,
 vigneshr@ti.com, kristo@kernel.org
References: <20240223093701.66034-1-bhargav.r@ltts.com>
 <20240223093701.66034-4-bhargav.r@ltts.com>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20240223093701.66034-4-bhargav.r@ltts.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/23/24 10:36, Bhargav Raviprakash wrote:
> Introduces a new struct tps6594_match_data. This struct
> holds fields for chip id and regmap config. Using this
> struct in of_device_id data field.
> This helps in adding support for TPS65224 PMIC.
>
> Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
> ---
>   drivers/mfd/tps6594-i2c.c   | 24 ++++++++++++++++--------
>   drivers/mfd/tps6594-spi.c   | 24 ++++++++++++++++--------
>   include/linux/mfd/tps6594.h | 11 +++++++++++
>   3 files changed, 43 insertions(+), 16 deletions(-)

For the next version of the series, you can use more chars for each line
of the commit message (the length is not limited to 56 :-) ). That said,

Acked-by: Julien Panis <jpanis@baylibre.com>


