Return-Path: <linux-gpio+bounces-4614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D71B088AB98
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 18:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FA9DB47CB2
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Mar 2024 15:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CCB155314;
	Mon, 25 Mar 2024 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JReD36IJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C16CDD9
	for <linux-gpio@vger.kernel.org>; Mon, 25 Mar 2024 13:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711373266; cv=none; b=aRd89mgAzzvmjrzLTiI4w3zPYba+hjJLLh7GyKB2gC2gsmLGyEsZHj4FUvr5hnrCwHDUktuPAYbLtS7KFfqsA/zlb7rEL/jJ+Cfx+5fbwU+QJtnLo3aY2mw2FHsny0VxJ3uy+JmymMNixP0jo/J7+AspvSpv5tK2sAyaCt//bqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711373266; c=relaxed/simple;
	bh=Jgosd1RfBlt7E8lAga7b+Q+Xg81HefZcEP3jiouQOEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKfFoPlhl5dn7z0pladAFZ/U34PTLS8BAR8P+/hvUYSJ9Krk42OSob8n522A59XEQu6c1Gadu5JsyIvHwehluonWCJj5pWeZkiQmHIzZT7L5NimM1Mo5Jbngf4KJUt/pAzE7hXD4m6/OWdcSNRTx4a9vRMADyc/+9BZBPJCAKQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JReD36IJ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d6c8d741e8so30005031fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Mar 2024 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711373263; x=1711978063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jgosd1RfBlt7E8lAga7b+Q+Xg81HefZcEP3jiouQOEw=;
        b=JReD36IJAA66movaF8lG+dZYh5GQnoPMJVZ7zC/mSqRPOvlrqreeBfixt+nSoHsVlN
         6QC+QAtFXdg72JTkhX5pYrq2Isv19e2kmEVwwBI9ChKndK8VUy+mkGJlx8SfAJPYbcWs
         5ZJU4kvJmmO8AjmajLfNDJeR63KFRmdeNtaBsVpZ+aRc/Ogttj/At7pnykUnfX8gGcUX
         FWeJ88UGvrmhPNguMfG4YU9oJY4Z2UtzpXmTqITgnjXsxbOP/wS/6S7iaBnKopWVnzlk
         p5poT/d5a5bYCOuDj34VBKbIyY8zehfJTZ6Lev1eac2pdqKHO6WEAsJUnomIFC9cxxnO
         3TTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711373263; x=1711978063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jgosd1RfBlt7E8lAga7b+Q+Xg81HefZcEP3jiouQOEw=;
        b=Rr1/j0s5K/O82gNPrJVg3A0N8FzxasEAgNtLVLrl1m8ff8Ha4J2NexSSeTcfQRI32N
         FnFy/cBA5ILz/a/YwjIxUQLc60gL0LeB5hXeF+hdUb6+n+2IczmNyjiMLqCGjsjF7IOE
         b6zn6BiV2uuGnWtSG97Uw7IEbtrUPGpNOyceD9cjF3pxnp8PqS591HdlCz3/vRQwpa+z
         SjvWAnXSKz02dugp4vqbCQB4pzzy27sNSvFGBVe8MHB2xpyicEQAaTrJNDWiSxWFe9Kg
         gyZWtSHMmGze+Mp9NP9D/1IhDH3OtlHgaMRdUuKadyiNLaUCbdN6/yp2wQ/1uBx5CLIi
         v9dw==
X-Gm-Message-State: AOJu0YzImXrIPqBHELqdv71hpw3NZ/zuSVzaFgVhi0Qbu21Di/hGRldH
	EnXhamB63NM4juHZuIoCvaRmFZxeN/mUdBn+TPT5Vf6BRf+TWCuZRydy/GiWICkqnPDA560cnzC
	KNrNAAgPstsoZjr5iDPYETd8AFeK4hMhqJpKnfOKljEsGxaAR
X-Google-Smtp-Source: AGHT+IF5UMhCMKchODsJNbojCWQF+gID5xHMI4nFeUoDleeyuGBv/ONlxa7gh4hlFCPdkFJx6i+/TAEYmisS2vbf2nw=
X-Received: by 2002:a05:651c:1047:b0:2d2:c83c:ffd7 with SMTP id
 x7-20020a05651c104700b002d2c83cffd7mr3869741ljm.42.1711373263028; Mon, 25 Mar
 2024 06:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325111717.113610-1-warthog618@gmail.com>
In-Reply-To: <20240325111717.113610-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Mar 2024 14:27:31 +0100
Message-ID: <CAMRc=Mdh2zyVWsHX=E2pnH2jRJtSWGXXAsZZV=bPEAs3qOAP3w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] treewide: fix spelling of "immediately".
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 12:17=E2=80=AFPM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> "immediately" is incorrectly spelled "immediatelly" in several places, so
> replace with correct spelling.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

Makes sense, applied!

Bart

