Return-Path: <linux-gpio+bounces-17011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F59A4DA96
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A1413B05B5
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 10:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AEB1FF1D9;
	Tue,  4 Mar 2025 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2/D30y/C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D27F1C2BD
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084040; cv=none; b=WlR7duwUbp/j4DOdHDOcD5aBvP9ydeSmfipeM2YpZzF8XpEJOgVAs0G6MpYrXqi/ydOD0ari4I8Aanl/JfODWNvIPtlgyTiD3Hiv2ny7eLML0ikOZwpngCh/tgJPRWLzKc++iAbujYURnM8nE7pYVAxm2dGIqr36yMNHLxWelT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084040; c=relaxed/simple;
	bh=VaeM4EBLjlRLaeRZ7jK8eXptVBhZ5/jQrDVTP9sdaTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHYXKKP+sRdu+3iuvRcQuX1JOYyr57puRIs3nAD1pEE+ktaWO3RfUxf9dug5AmooLWFBZF8bBtNbcNT7wk0xoRXeF8vxkB/wP/wIFK8E4NJGrD9dbCclolu8Oi/wZVgJ71sLdDrTb4IXOeuXFrn/SLR6Gxyug6/QKa973S+G/ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2/D30y/C; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bd473770bso67861fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 02:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084036; x=1741688836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaeM4EBLjlRLaeRZ7jK8eXptVBhZ5/jQrDVTP9sdaTM=;
        b=2/D30y/Cb9ppddS1CMkT6bUNXgDU6om27AwRzXBrxVgfX9YW88ST5iooBBucXWMhAv
         gE5Q0fQ1Lgsyoff6XuoqgAPzeJZYRf4SzTuX0XE0nC6PQQ1RfDe6+xkyPcoI95YlNs+C
         rJ8Z3dWRI7LMXvsB0EJQcJCtI6fLoLqtFM+F1seNGnV2h+JLkzTypPy4TXuSOy5QzkDv
         kwAL0b1rKLqgQfA66ru7t9WFiFe1CQWK/X5a4j+0tNbUNuskmxoVZz7vYuqzfraPZSS8
         9n0Yv6QRr3u8z3ZBwj75pq32mvghXGFIoxkavt7cu6a9OXYjMi5vSqARZyCZ7v7ayFRd
         XKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084036; x=1741688836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaeM4EBLjlRLaeRZ7jK8eXptVBhZ5/jQrDVTP9sdaTM=;
        b=Xzcykg9lcg/V3ZgSXSbp0QLwVLQ+3s7HwNW6UdAlFmspUE9YakmEF+Qf2SB8KrlWul
         QtJJcryw8gqiTJEorS6EdNe2dpix3jvFBpN3qNvhzvrFruE7TtkDwsgkFZukZglM4wZt
         LngHYV4G6aIN8wYMNc6vhMQUtV44NKmtDw/kII9olfXUSd1IxhR+nxozrMF/fpFK6LE6
         LEYfGfRl2VkN/HCT7D9fiUtuDC/71GmjoeeaNLL80Gs9GXdE++dManGJRh3jW9RfVDwP
         nYOBBG0/gV8Jb3bOzu0h35Y/qYyu52iZG0JKTGKsjJi1OSNfgfaslvCA7tM7qQh35ac7
         ICaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcN9Ms87xu1sr63cG42/BCXjqVq/wVFGafkCnlWkvNNeZ5A2s/FSe1nLdpGpmYLXVolv8+l0rDein4@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ3NcJzLh1I72ohnZteBCrOy2FKy6kVNIpvFyiM6TEZTKdSajK
	nK5X3BHayucNs6khIIYVNeLKdUIj0kOlHEqOoSe2e6hLdjFNNQt4kslMChV3xnQJzj6meJFcdbk
	nn/iYu/TCTAMwz6evvU/N8c1fo36mjLcGclJYIg==
X-Gm-Gg: ASbGnctppgvWQYUJ7nY1uS52AjqvIDvUdDdm11HWMUscp6jJRnRhCzJhln5iHVfirCu
	SqfR2k8csdYy9voT5e9DcHE4cmgLSsYO/IGisDQpI1tHarqop1VeO1cPYRyMt/rcBjh5RMbCAkC
	kvehKOipzcr5VduFt/4YTPC9pVYVzrI7yBGaCHvb36yIqF4Q+OFx4tppBlvQ==
X-Google-Smtp-Source: AGHT+IFJ0dfu9zZ39Ud4rjP1r2PPHDm2YkIXfMsFqKRfcRODX5Mj23DgauvJAFjRMJB4X74hHXOLMCsdyMVea/yecJg=
X-Received: by 2002:a2e:a7ca:0:b0:30b:ca48:1095 with SMTP id
 38308e7fff4ca-30bca48154bmr9735351fa.7.1741084036451; Tue, 04 Mar 2025
 02:27:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org> <CACRpkdYfcf0toAcU5OEKG8paOv+x4KXSNMEyVoyULpBONZq=EA@mail.gmail.com>
In-Reply-To: <CACRpkdYfcf0toAcU5OEKG8paOv+x4KXSNMEyVoyULpBONZq=EA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:27:04 +0100
X-Gm-Features: AQ5f1Jr8qZEBdDQUIP2Mrz_5IoFFTxHRFJuC9PDdwCqsWXm8NSVEvmM91MKiO-8
Message-ID: <CAMRc=MftanJuksgUG-BTYSzMDcrejutYcw6E_d68XO3dZGSXbQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] gpiolib: of: Handle threecell gpios
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 8:44=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> Bartosz,
>
> On Tue, Feb 25, 2025 at 8:40=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > This adds some code in the gpiolib OF core to deal with
> > several gpio chip instances per OF node.
> >
> > The change was prompted by the need of the Spacemit GPIO
> > controller.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Maybe we can merge this threecell handling code so that part
> is set while Yixun is working on the irqdomain translation, I
> think this could need some rotation in linux-next in the meantime.
>
> Then the threecell irqdomain translation and spacemit driver
> can slot in right on top.
>

Sure, I had it in my queue. I'll apply it now.

Bart

