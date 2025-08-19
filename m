Return-Path: <linux-gpio+bounces-24565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BBAB2C64E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 15:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A42815C13FE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE63340DAE;
	Tue, 19 Aug 2025 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bVh3bz+u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE3233CE8A
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755611443; cv=none; b=lIl2Jp+RyaPC5v+jUG30+NQPfCiFu561sJM6ETih7bVpoi6Pz/2N58FpNa5hcNSbnHEr558T8v/N0z9Pg0Qw5oJ2wmG4VxCIwaqOjeJOhh2qPsp+5wFore/I9A1IC/TfxBxKzdy36nAVnod1FjFNxDU4GV/UjaMWJ8R7A2AXsFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755611443; c=relaxed/simple;
	bh=4FLK4uwd9XdTQFJsLCjn7vRojAV/LnaXAkG7LhXSXzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAxZYbjWhbQOa0GlmhDsJqx4O+X6BxnTqcrxEAC2MQVhSZm8OlKU9SuL7jBd3IUOXrJKrUpjUgIAgD17u7fIe/GkSHv1Oe+n+0cd+ZCjWvQlLPm+JrRQbf+hwIu9W8Y/gaabLboxv864oW1T4Cyfn++mG0L+RYZ05MWUunjICX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bVh3bz+u; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b0d231eso29698085e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 06:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755611439; x=1756216239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDSkE7U9Qu4I+xfKyU0ZKG/iraqseXuPT2xyK2sdU+M=;
        b=bVh3bz+u5fPXs7gV06n1Sp7bll/5JSo6QB7YdaAn0FpW+GsXETkgPGA/2eda3oQJVo
         0YmpR2RyrIHB86nbfwHV44GCTmueBBau/cB0Ah5RCIxMdx35a4igGMUiryiLJF0w91Yh
         ONm39a3joRxaAnL8nXsRBcKV89thMknocVQBuo+1crP04FGY8KDMXq1jfE6N44FszoSJ
         DXpvtO7Sce2SvV4l9bxwUKzF/A4NumK1DVaYLDSsUwSdzqMKBis/6HsCSvMqSCnbpcer
         LVkfYWuWGev5V+2kX8GzE7UxjMbtbqlCg6Mi0Xlk4J+DZEDJOiwlYwhPHIBFmHb+tcR6
         unQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755611439; x=1756216239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDSkE7U9Qu4I+xfKyU0ZKG/iraqseXuPT2xyK2sdU+M=;
        b=IaGrof+OUVtC8Qs0VtzK93xg17I9KpiqVdq0V2y6X8R6/rtenDVp7APf9uwzn3zaEU
         XhOpxZYWojXA/bYjEacllxJEBfmGb2jNGvYBWS6Ow8SuOUo0PB0yg59gWwruFxsJpIYQ
         AC/528A+RdATmawwRfmovKYxKWTLUyLqI/id0H3znHSxgfCw6qtClKUhwZmVrRHY1HTh
         OFVvlNAKDnsgw2abJd3N40v5nTMJhLrZNeZgBI1rEr9jgFRG83lulTv7/wCAc0Jilmvx
         5mAhvEPGPT5EvSYVQmmXBFysyVAqnJVRcfU3XNelpZFq1lq2Uo48x/Dddi+T6V+GKtpv
         Mu7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkhF4+9peROyGhTZ0FfqLpjvnf8O9XzYJ2bddGEriPBXK+z/h3gy4BMRY2+FkU9KKBs51QDBrM60j8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfz8dDrdD8oEB5nZoLsIPXuVI9VaOio2lrj/AD9SeEYhCh8s/r
	lzniVyJm6tEnBLe0RYrHOLm9QpRn15kL9u264gAdzMD2UIzPaIA4wqhHJqBkKk4xl4Y=
X-Gm-Gg: ASbGnct3cVaWh6hzs4UOsm3L0r7WmcqaWrZvmByl5Cdw0KlFRTb6Q3y8hSypMQbfZaf
	oSO1g+hIQIEhhbPdt4RwiQY0Vkfma6T9D0VWZZSbdgbAXAV9JZoRshrN3ZJGYhBWawuWPmH00gS
	6xsokB8RTaaDlSdCECc6HbznwccJjIkSUdCNxl1/iEm+xGGKvEGoru6c9vPE/7jmep8xPFMlFpK
	oXfS6q3GTSSerUmzZ9HiniZJrRkyI+vITEnlRKT7IPBLZqLXrfXojAw61eaQMGBuv01deMyMBjk
	hotjUUPAIDBGyWyt4wOaw6+N44QmLz44dDn9eZp6okitLndGWLz8DVmW9JSbjYBfhrl/vLr6gSF
	0m1egDtbB+LzR4oHtPnucRgqkTJoersLkWRfa4itosG483KRLQHJFmEx1Oss0pY5aLhdJfSFGwK
	l+cw==
X-Google-Smtp-Source: AGHT+IHX13y9qpR1ov+G1SAxA5zb/tzK+QDekRax5d5YMmmYIt2QlNFE9FY4s/8+jyJkR7c3tds4tw==
X-Received: by 2002:a05:600c:8b5b:b0:456:fc1:c26d with SMTP id 5b1f17b1804b1-45b46854158mr6209225e9.2.1755611438859;
        Tue, 19 Aug 2025 06:50:38 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:620a:8b00:75e2:191e:43ad:ebe1? ([2a02:2f04:620a:8b00:75e2:191e:43ad:ebe1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c61a66esm214297945e9.0.2025.08.19.06.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 06:50:38 -0700 (PDT)
Message-ID: <6322a45a-c1bf-41aa-b2c6-f169a61e3a41@tuxon.dev>
Date: Tue, 19 Aug 2025 16:50:36 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add suspend/resume support for
 Schmitt control registers
To: Biju <biju.das.au@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250819084022.20512-1-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20250819084022.20512-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 8/19/25 11:40, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> The Renesas RZ/G3E supports a power-saving mode where power to most of
> the SoC components is lost, including the PIN controller.  Save and
> restore the Schmitt control register contents to ensure the
> functionality is preserved after a suspend/resume cycle.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

