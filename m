Return-Path: <linux-gpio+bounces-3963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EBF86CA8D
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 14:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9C531F2392E
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 13:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E7E7E782;
	Thu, 29 Feb 2024 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GtQCeEs3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5F97D40D
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709214284; cv=none; b=jVoV++xgborgkgVDR4M7L0Mk5SLsj2X0xaAYFavPY9YAApmiieiwjH1FrbdSRon8jFcGdS40WuPTNchfO67+bbfNKysUN6RK+IGrcskzKLQSUKAJ3mbM/nBREP3b8eOyBKbH72EfxJQgU1Ir2fgS87mrydJQyFBmGuTSL+l6imY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709214284; c=relaxed/simple;
	bh=arYLC+uZ4uuz1T0M8gbovYAhzFuJ9VVOnrgFslQqpSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDbN3noMgApH/hzU28hIjrnZiWKU0++LO4UdDNgZBHbC7t2FuSGSe/5MDUr5eWHvGSTzYz8VGCrmQcl4AfcJ/Artw7Qam+H8OAo+7m/RkNiq5DQDdquAOzWONSnNYwnPeGDJRpNo1Z52FVfir347hVcq3dnEjp1zoIa5K2+JiBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GtQCeEs3; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6d24737d7so976017276.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 05:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709214282; x=1709819082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arYLC+uZ4uuz1T0M8gbovYAhzFuJ9VVOnrgFslQqpSE=;
        b=GtQCeEs3kiF6VYu9JuoXQd01SaOVA25zptc9Dxf3N/ldn/H8BvGz4JZAJoS+UixGS0
         LV7ycB2jd3Pb1ZwOERbxC1SRNbm2TjBDUBMIBrir6cEEC8ta5rofFLJXAFXFt0+dEaIz
         /TNjT0wAMRB0oTSsU/osKuY6eAGjHn/ifs4QHRbAwpvKRPBa8/+Tqoo5xSXwDocVcLTI
         2Tk8pJ6V0iu0XfGRS7qGkKQzcX75FhGfseE1ymGG61I+1bgahaGaUVR3Sj/Yu0q8TQJ7
         x9oZmx6WNk4oYwCDatYW6LfZe0xKAjtaSwDfaC2dF60xayFhMBGCKTg91H6YYy8OWAn+
         EDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709214282; x=1709819082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arYLC+uZ4uuz1T0M8gbovYAhzFuJ9VVOnrgFslQqpSE=;
        b=nIqzLljzy4um1nOhXXeFaK3oc1i3j+cu1opfyt4gfJr9uFyegen9J9NBTzRYlfGfJs
         A7ApfKf6AaeIPcL11m3iDCx4vPCChsCuWxI4GR2L1zsWQTp2nIEoWKUoa+e0MvO6a1rc
         pl0WUTF1kD28aaZvuHzELDs6JrU68IjAkjAxYRYjbJfnh67oDbmpTsr7knqinEiPwvmi
         YazzCY/X+A/eKefrNESUxjtC3zSYuxJQOXmB8WDIcqPih/BwiTB6Xj7bKh4ZVSG5l23p
         S7fY845ItkoE6RuKdTAqEf/bX1KyIcNMsNPHrb9NRuQAz5smtDd+btKBsdSTFuEBrg7C
         ZcyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+ypXssF1d6AGhH5sXgSCDpBjm9N9eJrTXSmJGYOnpol4dLPjQWcupx/YALzUNkNfP3SZhEUUPLD7ucfnbedOzaONJTW/dSch1+w==
X-Gm-Message-State: AOJu0YywQ3+QR6bDfAKtaFCJqwiOxJSbRHck5MfK5JjZIh78aCb98jZa
	vN1mHBj+RMuQqX9PEQII2o1MCSGh5OjL9sgzt6XvK1ShLTOOfl1EVxeEXSFPnFPzJ16o5xQ1TEw
	ujip0gnTC9AAGsuUAG+ypRvDdBGF7mxunAahast5fPiPopjX9
X-Google-Smtp-Source: AGHT+IHi8eN5Wfh2JnmE1aIOt4CnlHTYtAv38O2XfHtZHksusIwxcm29Hb2iH0f+TCoc79GgOaXGUIH/luIX+BZx3cU=
X-Received: by 2002:a5b:a:0:b0:dc6:e4f8:7e22 with SMTP id a10-20020a5b000a000000b00dc6e4f87e22mr2044131ybp.62.1709214281995;
 Thu, 29 Feb 2024 05:44:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226191607.397386-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240226191607.397386-1-biju.das.jz@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 14:44:31 +0100
Message-ID: <CACRpkdaPx51z15cdGKtZ9+KEMLMver1YF5QnzkX+XDSG+LL-eQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: da9062: Add OF table
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Support Opensource <support.opensource@diasemi.com>, linux-gpio@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 8:16=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:

> Add OF table as per the binding so that driver get instantiated and
> bind automatically when the driver is built as a module.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Patch applied!

Yours,
Linus Walleij

