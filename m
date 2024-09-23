Return-Path: <linux-gpio+bounces-10356-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DE197E7C6
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 10:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D221E1C21315
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 08:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1A91940AB;
	Mon, 23 Sep 2024 08:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VNNxugWp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EC618EFF8
	for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2024 08:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727080994; cv=none; b=hII3DZrJFSJNRmzjtXwdUMbyg0DYU7C/HFcSuFS5K/wuqBaHlaub/eIUlvnFwuPRJcT1lb96rw/r4GtnASHTabsygY5+esdIiffmM2/6jkWXRjQgr5POmDruTJkDTRoFcPAc3VvTZwTFsLGErtbw3T1A/YJi8bEArlEBPvM/Jyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727080994; c=relaxed/simple;
	bh=XSzUh6ZJJ6sFM4hLu82VZxpVet5y5KagtnDBdYcnFF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REPXE135AfL2lWpafCKaDnbtps/aRcwTUri8KvnQOfDkicd4hC5VwujLQq6nM8h/XuTpCOT7jbAaue5Qp384XnsLdumHYcJi5jO1DI6ASbLpCOaxc3X/Q4aBXW9RNLzOhmpKRJtaKL/AUnYE7v+hyye4aV2OtdFK4yZCRCPY3gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VNNxugWp; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5365cf5de24so4892184e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Sep 2024 01:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727080991; x=1727685791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZz5ns/39I9CNLcdEHgb1bq93Bmp6tryH2rW0CAcV34=;
        b=VNNxugWp6T0f8fg1SEvBLPmORAIyl5X67B9rqHxra+5cBaITskq08SgONOHrMM4XMM
         xq2vn09c64cji3+XsveCGACoGMWqclM8zSajempw4sf73ujdfagGNJlu/O7yLIxzO8is
         qbfCIaV+506+gB17GiZAXWwI5fQ+FkLpHp7Rjp7RPxZwBT/1T6FiRXsC9kRsZygHWC5D
         jYy8rCjidApW3Ui3gqmvZA+MOckjjlLZKGWXibJ42Qw/1qp+uyGLrEmhrVojyQPWLp3X
         K7clY16foXVp1FjZK9DeLUB1vIJBJCAm6P7E/l5N+ew4nCqL9B9PCxhGDjhaQKM+rPyt
         Y4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727080991; x=1727685791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZz5ns/39I9CNLcdEHgb1bq93Bmp6tryH2rW0CAcV34=;
        b=lum7Bq32tss5Zfl+IFlypHu+59JmQdrWhmEZzOGJ4Zrm0uHcEgoCLAbBN0fVZBfHbv
         jtQvEQwzUI5D8RiSCvgcf1rNikIdHgLGf5XC3ONc9emy98z78Hjmmdl15ejZPZZlEQn8
         WYlaJZr/0/7FhPmAInTBnwctNmwsetvpzpnec+J6FfWCz0eeVLSZnngAKlI2Tgg0w2XX
         oqf0vUSfQxg+xNcZ4JA3FN3jm+kzowAu13bPBI3PPxba2PKGxXuy8mKbT7OndmZLP498
         Y4qge/NMoYeOfDG3W54+0mqNrLaqnrTGJEjgnBnzpvfXfejxhWpmogwn5nosHsFvxP9l
         s1og==
X-Forwarded-Encrypted: i=1; AJvYcCVJJxyUG0DbWPdyo9SNhFWoW3ob760K/mQF+FaZsSNKJFrBsxKsAGboefSMaWHOcGxaSCrUzF5RcWzA@vger.kernel.org
X-Gm-Message-State: AOJu0YzbO9xTpoOlU4o4UOD401BSe5iUNxBndLE7ZK6kRNLi1sRVfkxn
	6Ypf+SSmqe5FZdPemenB/toBbSvfjzR7+gSu++/4osCZbA6Yd/eTVG61buQ1Kcp9tiaOtJeEM+K
	lsyKKA7RGfLgTmvtersx3QcFUWp33hHBoCfLX6g==
X-Google-Smtp-Source: AGHT+IH/lTkkxNf7gVB4Qk11bFX5oTtze9g4A3iaawv5kVYgzIVZ7trMrLr/mwDA4DTElB5MHwruJq3qAdcaDv06+ig=
X-Received: by 2002:a05:6512:398c:b0:535:6033:265f with SMTP id
 2adb3069b0e04-536ad3ed8a8mr3787007e87.58.1727080990398; Mon, 23 Sep 2024
 01:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906110113.3154327-1-sai.krishna.potthuri@amd.com>
In-Reply-To: <20240906110113.3154327-1-sai.krishna.potthuri@amd.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Sep 2024 10:42:58 +0200
Message-ID: <CACRpkdY0VRAD4+P5aFiJetjxce95K1fDeeYVYwimrMMADRb9fg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] pinctrl: pinctrl-zynqmp: Add Versal platform support
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>, 
	Praveen Teja Kundanala <praveen.teja.kundanala@amd.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 1:01=E2=80=AFPM Sai Krishna Potthuri
<sai.krishna.potthuri@amd.com> wrote:

> Update the binding and pinctrl-zynqmp driver to add Versal platform
> support.
> Add Get Attribute ID in the Xilinx firmware driver to get the pin
> information from Xilinx Platform Management Firmware.
>
> Changes in v5:
> -> 1/3 - Used the pins and groups properties references available in $def=
s
>          for properties in "mux" (suggested by Rob).

Patches applied!

Yours,
Linus Walleij

