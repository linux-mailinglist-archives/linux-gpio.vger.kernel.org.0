Return-Path: <linux-gpio+bounces-12273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 768EA9B3F30
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 01:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BA8928359E
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 00:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54DB8F5E;
	Tue, 29 Oct 2024 00:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwKalxcn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC1C1426C;
	Tue, 29 Oct 2024 00:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730161864; cv=none; b=aQMLHP+I5gxzR+NAmi9X1JOsWXRXlNwLvV6aiHrPFPejyAXKA1ZE6gZu7kWL99hKnp1eU+GAduAnBHVl5b9winD7SGcsEpwDzImQzzfjtMK73ASCINJJXJ4NzlpSUZ+eYBHNKAUi9cFVquai0v8a9SctJWwrwzupdp8Z/fsNeOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730161864; c=relaxed/simple;
	bh=5j0KH+uBu0d+yHWSxUFbqzwczcgyAn/9EoYnOuV7ZQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGRnHwB+Cg0LU8bOmhC8KAt1gg8tIiG4sVlfZ7E8NVFdUCCmLN46pCs+SIMKkgm8L6cT+36WbEd+MJbRC41k4CYLi2fKAH7Abd4LwbUn+P3vPAAJJhuHR1zZESv/5DbZea9AdM7iviN0j/WTTAza9OWPG5Evf7ZpTmfofUK5ZAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwKalxcn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cceb8d8b4so27987725ad.1;
        Mon, 28 Oct 2024 17:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730161862; x=1730766662; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rwP95ZMKY4OhC0gDOi3064T240SYV5VJPiywQTjinP8=;
        b=QwKalxcn+nosRq25iOj3enbfbadsI65qzGhQBYOwIxOdKKcabyXpRUvLw3MatQVNTo
         0OztoqNad++3K8LA44kKf8u9lGbkYLm9JQunRdLaZLitftUW9tFDxIAmeZwDhbOdgWrg
         0DQvaCaNZzuMI/TfLNiIyXh6h/+CxoUl/aWykA42v6i5XR6uvpkv6XbTZUNG5lWjK7Ie
         rsgE4/1HJELrCghFn+NgqFFRj4cjaGg1Bq9SWf7CKrEdJr3/bC+5pB13Cm2gzbZFs8CP
         aHZ+ZRE1HXtyS6A8MSJL5ucOye4BTdNqzevQp3bCRtbRsZUyysHZySutdSSqFTGWScq6
         huug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730161862; x=1730766662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwP95ZMKY4OhC0gDOi3064T240SYV5VJPiywQTjinP8=;
        b=E4XEMQP8CFxG5E39hXh2R/M+Od2a7OPVcyFT/bp0B0bgbW5s34hO6V/fnGicRm7tX2
         +foAebe313lRKqv0P0GIJdTPl9XiPCwemBqn3DL+F3hWYNUdyJhVMgYd468mfqOO/PuZ
         cGAEzGfwJsiAv/uiYUCiL+4hRdkYH0+DQWTpW9vm6weN2OI4kgz/HJ9rOODGyfR7r16i
         tRKA6vbMy0zWvr+YYjdAGxMwXti075BSHhPWvdsQemQad+yaMVYxFnr5o1EfP3oP/EdE
         Af/vvK8hf9n1wRR0zxzmP/kPD5+02P2sAoALuIkzUoNONdvXPFOtYb0frX5fMmwQsIzg
         RK7g==
X-Forwarded-Encrypted: i=1; AJvYcCUEpaUq9ZTGKigmuP183gHIqBMyO3+YEnAF/IzjN3Zou1bwzktm7jCS1scAPmP93IYW++hImWd9QkABJBpc@vger.kernel.org, AJvYcCWO4CxEmuRKzPMpQ4UG9bI5t9Fn7+Du3sk3BhCuhkoI5YAUAGTSDO/rlbUYSLOiFzB4dHu+hZpIiwUE@vger.kernel.org, AJvYcCX/62REUlvE2+CcqwhixxS1K4RhbIt1kV6ioxoCsOprs2QsVLOygdwRmW1m4Z3SzD1vThAWZhftKptfUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgUuFSdFL1bK4nR1OYNCTwtuHgZdIY2XxfUI5ViRJ7ACYmt3ye
	fGrse03XSsxdz4S2FdEP5xeQeL6X5qMP4ZbuIh8yXEQBnQCIE7I8
X-Google-Smtp-Source: AGHT+IESpTU6eaOAPHzlKBFpkMOmcfSYW1lo5N6fMf7AqDlKt2Zr1wW2Vpq20ZcUGF0jGeRyRBXr6g==
X-Received: by 2002:a17:903:2289:b0:20c:b3ea:9006 with SMTP id d9443c01a7336-210eccfcd8emr5541975ad.6.1730161861970;
        Mon, 28 Oct 2024 17:31:01 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eddc19e368sm3941319a12.14.2024.10.28.17.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 17:31:01 -0700 (PDT)
Date: Tue, 29 Oct 2024 08:30:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] pinctrl: sophgo: add support for SG2042 SoC
Message-ID: <rbb7nlqjvek3tvjtfrqnamp6bbhmdq6fe57ey3pfk4gvks4yd3@rlc3ri4fmxiy>
References: <20241024064356.865055-1-inochiama@gmail.com>
 <20241024064356.865055-3-inochiama@gmail.com>
 <CACRpkdbUs1eWgZCvxNYqpnUox2=4nwewBi5YPqSBO8UDhikyLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbUs1eWgZCvxNYqpnUox2=4nwewBi5YPqSBO8UDhikyLA@mail.gmail.com>

On Mon, Oct 28, 2024 at 02:02:49PM +0100, Linus Walleij wrote:
> On Thu, Oct 24, 2024 at 8:44 AM Inochi Amaoto <inochiama@gmail.com> wrote:
> 
> > Add base driver for SG2042 SoC and pin definition.
> >
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> 
> This driver is clearly duplicating a ton of code from pinctrl-cv18xx.c.
> 
> We have no interest in having to fix bugs in two places.
> 
> Please factor out the common code and use the same code
> in the new driver if you can't make the new driver a simple
> subdriver och pinctrl-cv18xx.c.
> 
> Yours,
> Linus Walleij

I will have a try to abstact the different code and reduce the duplicate.

Regards,
Inochi

