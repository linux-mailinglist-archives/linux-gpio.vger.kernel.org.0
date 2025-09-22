Return-Path: <linux-gpio+bounces-26496-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2C7B91F50
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 17:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B559E2A35DB
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AA12E7F02;
	Mon, 22 Sep 2025 15:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Vyhse1P0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6712E7BA7
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 15:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555234; cv=none; b=snkHZfgDtJ1y5YHd0RK1bsGRB9KdAxMcDUFfFoiSHIZJUqF5pCnSZeB5y1kms9QkJKzFZahrTkYHjnJIhT6KT9B0d5Z1AqwqfDo6+kIEI54dQs93OIdVS8S2R3uk9px8T665uo4IQKuEhdQjRxnrIonxFM1HE5AqCLf/61WR6b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555234; c=relaxed/simple;
	bh=ojYCHT6pXa+exxltZgESY7Zvtrqth85NG5vUjQjg5a0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnGbCNks9weUFX4DofmQrwvXzHdscdxslkzPrSlFUfpe6Z/gyYu18vv03LYUcPC0tRlBxw2qiY0cRhe5zCsSNdmtpg13AgVW+nKdwB/MhaE13hglPdVcQZaG66lZ2jPqb8JZQhFJkCQjF4WLP36rgXe9x9xUqSQb8AeFxf87bGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Vyhse1P0; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-36295d53a10so36476681fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 08:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758555231; x=1759160031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojYCHT6pXa+exxltZgESY7Zvtrqth85NG5vUjQjg5a0=;
        b=Vyhse1P08xdAwVF7IUBO0VE3gPqvNZiaHJFiTnrslHL8S32Gsj7co/6LECCPjweuNX
         3iKWmCXFMXGmTJYsJcciVK01yJKMS1D+ZPTH/Rj6qsyKbGkckSFFJZfhezG4wtO5/Kvq
         /h0DlyMKdyY/3z70kAxMsAZUgqCyk3Xss7D0bRx4ipkHy72/5I3BOWItzv8VAlEZ5lq3
         /Mf0Xqqj0I6W4mhm2CXlZEXeaZqJj9bgvno7tYYK2tkuhuNdO4lNg+GsKe4DTFyxsybU
         dr+k20oK3Yza0CfhMhTtYd17ErVHFEE9SQjL3yV98V3O9UHS7RzdlcuQKQ7KZWsmDaFn
         7XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758555231; x=1759160031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ojYCHT6pXa+exxltZgESY7Zvtrqth85NG5vUjQjg5a0=;
        b=djkHgXeC/YAWsq6vkuZLhAPO95lohUeUF8jdm90uWI58Ln8ACOQXMRoFSmStx+uuQN
         DWKEjd2V1TJhWOr9vxGnxql4+tqaNLWvYiT6B0HkvLMvYkPfkNx3y6fm9F8Lqhc8tBFz
         x6196LsOb6s+XmN+PjeTZ+8vpXN3ke0tXKsVLyupadQo8K8XXnXuFarHrGnrcaLjj8Bx
         5aHOP0R5uN10tBHuXao4zFeK+Zdd6L/w2hneHO7sS4S9GKst8Vv4bf5iLpPRxBruyGEz
         +2SlFt/zHwrIw0o0GgTV0BiEKs5lr48zGuO+SQRJmQQPPFqDopYgcv3Ddq0xXAYqGb3r
         Hl4A==
X-Forwarded-Encrypted: i=1; AJvYcCWui8TS2R9GnBVjtNGtiGCi5bKZB0BrKklNMyRoubyCp6+bUr1mNRz2Y3AcG9jJmmVM+R0IxHH+h2T7@vger.kernel.org
X-Gm-Message-State: AOJu0YzIAFEFq2Y8N/GilhaKwFDnFdGbj4K2c1kPUXwyRDWLqSMcxaG0
	IjS36s9E/MpMZVFGHJS+E0nmxPPZOOvEOa03WqRa9L9y8lEBUZrVy1wLObRayIak5YRl2x8EdTi
	C7gGE524taD++2eidFNhiydm362ZcYi5i6AapDb/pwQ==
X-Gm-Gg: ASbGncvKC99JWEDBcxrNrrxNqvzW6HfACs45Ts0q4ekE0deCxBMOPjQxHLn5jtznw+I
	eYQOVva4VniOvqcWpuZSTPeHPQRzkvgVuRUdWOQWbrcL8JJ7V9twzhfVW5PemmF+bwqigBGTD6Z
	jBSro84eXgBUx96FH+FiNI7In+fvOb/Nl2mvi/qRP65WpX6sZ7AzcSNfndLO+QBn4p2+pZzr2S1
	s2fMXCm4BOllTNOQesSISDjczubbjCiqjTVGg==
X-Google-Smtp-Source: AGHT+IEaxzAg/HmbDrrm3iNmazyaqrQDYYZPj2rvNhR9IFx4P5LS5+Mzvc1t7Vk0Fk6HmKT8D4/HKt9kzkmiJNQ9aDI=
X-Received: by 2002:a05:651c:23c6:20b0:332:1de5:c513 with SMTP id
 38308e7fff4ca-36413f129c2mr36067881fa.4.1758555231093; Mon, 22 Sep 2025
 08:33:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 18:33:49 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 18:33:49 +0300
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250922173145.4d4dbb2f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-6-herve.codina@bootlin.com> <CAMRc=Mf9OB03FXEpSXG8XeJhtd7MkwJTH=rY11SBb9SazCMqJw@mail.gmail.com>
 <20250922173145.4d4dbb2f@bootlin.com>
Date: Mon, 22 Sep 2025 18:33:49 +0300
X-Gm-Features: AS18NWAxwgYw0JIB0GARrV9RmnofX0awI5c9l6TU71Tk5COkBcCbFGmDIfXMzbU
Message-ID: <CAMRc=MeLDe+o6dWkFCv6zc7ubcXicWdw4FA_A2p519OC4SH2BA@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] ARM: dts: r9a06g032: Add GPIO controllers
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Sep 2025 17:31:45 +0200, Herve Codina
<herve.codina@bootlin.com> said:
> Hi Bartosz,
>
> On Mon, 22 Sep 2025 16:22:14 +0200
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
>> On Thu, Sep 18, 2025 at 12:40=E2=80=AFPM Herve Codina (Schneider Electri=
c)
>> <herve.codina@bootlin.com> wrote:
>> >
>> > Add GPIO controllers (Synosys DesignWare IPs) available in the
>> > r9a06g032 (RZ/N1D) SoC.
>> >
>> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin=
.com>
>> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> > ---
>>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I have just sent the v4 iteration.
>
> This patch has not been modified in v4.
>
> Can you add your 'Reviewed-by' in the v4 series?
>

Sure, done.

Bart

