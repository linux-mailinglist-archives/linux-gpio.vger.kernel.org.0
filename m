Return-Path: <linux-gpio+bounces-8563-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6EE946F5C
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2024 16:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 352E31C209FA
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Aug 2024 14:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB58455885;
	Sun,  4 Aug 2024 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fES27Shz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AF13BB21
	for <linux-gpio@vger.kernel.org>; Sun,  4 Aug 2024 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722782991; cv=none; b=XeDwmFryQ+fHJLu9GmBR8X6YDG+oUhwC+7v47F8bagMjAeZW5+Zq5e8Iz30cR/JfiP6HEX/0l88AV0vresBJDn/SSI8mruEjoEfecB/OMNayPak1IUfqPwnYKSn2HM1RBq/tsiNCSjU0tDlyYjNA3BeydcmJpZ1x6pwjTSdwQG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722782991; c=relaxed/simple;
	bh=AuZHhjCN5jCQg2kvs3f8QvzEyIHWanB3hCnP8dwX81Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WoBo5P8wu3UtdPs6V6/ue3UcfTjF2qAvAu9HFdJoodXDcItDIsqkQV6AqPwNuYVvDab5N8u9qUywIuM9NF6pYukQ1HijChTe5VOfwn6ndlG3MyFEUqM0ByOdmmEsBo5Uoic4CIYJ4haiIXYaOmawTPnYj5Klxaf5lnElBSXPit4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fES27Shz; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ba43b433beso943554a12.1
        for <linux-gpio@vger.kernel.org>; Sun, 04 Aug 2024 07:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722782988; x=1723387788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AuZHhjCN5jCQg2kvs3f8QvzEyIHWanB3hCnP8dwX81Y=;
        b=fES27Shzwhm/IJ7TsL8lx/huSieCx2okPgFMeoNNKexpzUcmBHF4vdqMtNRsEG/Nmc
         UJdkYUXvPq6BmfQ1ZHYJzTinz1eHKgh7SOpmKyyUmcwR2VdSEeouQwVV8EwT3HOh4sRl
         nnC+vgQBdLXtt67oDXEfGWzxbL2TJgjWz/5Ynuf2tJGHoe8GknnAPdlOd4VYH6iRI/fQ
         FrPpQk5+e7/T+allrPsUZYZwlg+5k7HRFXUpuDKSs0dldzSUJWxRtL4ANQe/+vDhgb6J
         aWZHySkEemzlWH6FQ7ExaE9tVcQU/X3NbRb20qHRH06wsGC4KWCNrzOImF8J74cFCqtA
         GiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722782988; x=1723387788;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuZHhjCN5jCQg2kvs3f8QvzEyIHWanB3hCnP8dwX81Y=;
        b=EoNgNauknMVa4v0bSq7Cc+nrvfLbT/bEF2RGg6dNEPdkqFQ7H79f14h1rsAErVWeO2
         7Q9I8AxuxtROQlS7KR2DMMd3ZgD1aqaN6RV0B+NhyliTrxJPEnQTxYdaX3Qjz+CJbfWJ
         QCyKDb40r196psQqUt+oWfMCI9uniLxhL2ux9gKsfxVl27rfzc6DioLd/Do6pxbB5D6Y
         3/2PRHPuTIuYTJbme+AyOIub7nPxai+9CMQ0jAN3F4sCAhJPWFsqZgtWj6ZkxB54M2kJ
         IXMJHKzULwp3SoREeCLbfJFEjBgimXtfT6K6XfqAgIU2g2tQoTgaXa9u7x7hpT6xBJTR
         ZMng==
X-Forwarded-Encrypted: i=1; AJvYcCW0eLGu2PoCT0NNiT3tiDgHl4eCLya412BM7shXeGLSUvG/y4ACaLCkl8M6bUP/nHMqfnYygVjbsW/BZRoV5Wy5lvYB6ASoQjTMxQ==
X-Gm-Message-State: AOJu0YwT84ZzqWZXy/W3cBV5wtrgQ4vlB8b1QHlewZv9eztTvsCb2171
	ftY3SlRyxPWN2YER6kXq4WStdu/fbdGyN+POHq5RY0hWvMArBs/1fWDnz4xC1gY=
X-Google-Smtp-Source: AGHT+IHUS2Q/DAwa9nBlsAuDvEzxLcxVuIliG01F8tdRYqbu2WjNfjWXFKb/ECNz7uYxBkM7e3iwDg==
X-Received: by 2002:a05:6402:60c:b0:595:71c7:39dd with SMTP id 4fb4d7f45d1cf-5b7f5dc1413mr6890631a12.34.1722782988248;
        Sun, 04 Aug 2024 07:49:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b839b2b0f0sm3626118a12.28.2024.08.04.07.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Aug 2024 07:49:47 -0700 (PDT)
Message-ID: <bf1faea5-bc1e-46df-bf68-c222570c09a2@linaro.org>
Date: Sun, 4 Aug 2024 16:49:45 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] pinctrl: pinctrl-zynqmp: Add Versal platform
 support
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
 Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 saikrishna12468@gmail.com, git@amd.com
References: <20240801120029.1807180-1-sai.krishna.potthuri@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240801120029.1807180-1-sai.krishna.potthuri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/08/2024 14:00, Sai Krishna Potthuri wrote:
> Update the binding and pinctrl-zynqmp driver to add Versal platform
> support.
> Add Get Attribute ID in the Xilinx firmware driver to get the pin
> information from Xilinx Platform Management Firmware.

Any particular reason why you are developing patches on some quite old
kernel?

Best regards,
Krzysztof


