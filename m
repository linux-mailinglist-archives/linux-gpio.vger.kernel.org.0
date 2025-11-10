Return-Path: <linux-gpio+bounces-28302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCEAC483C2
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 18:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5AAF94EEDF6
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 16:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B84280329;
	Mon, 10 Nov 2025 16:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MEYP/0cv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7134257845
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 16:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762793883; cv=none; b=CXRNww20uQX7r2wyXRVPJiLrdIFadqKzmq9tbrXKEsKdL9j63HZEgS/n0UQc7RHWd/HCNHXVEo2yYiwpxvNkNnl4p9uU8kROdnz9WhznruS4Txo+1eAX89d2/T1CC4WDd0BzKbG885+SIfVuMIUUXIP4hvfDkikv/473Z3vV4Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762793883; c=relaxed/simple;
	bh=rrUjnTakXAhjUzCetAR0m4o3R3KIpOKUlQf3gmLgolM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9LIAL+ZnCwfC2RgwfICh7hM4SRk7JIx/auxin0Z7XQJThZO9UpNQLzGOcx1vMgK5J8LnYknQM4gToSrEXrr1JS25olTNB9Hej7EsWitttXTI5NBHCAy1SJz6DVNEDyDyMEvk0CxZEtwZLSVIsrn1OT58wq1leWWHzoO7FXZjeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MEYP/0cv; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59428d2d975so3354163e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 08:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762793880; x=1763398680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrUjnTakXAhjUzCetAR0m4o3R3KIpOKUlQf3gmLgolM=;
        b=MEYP/0cvrBchnVCREqvREUfAZlphv8AnrHK5zz6Y1YkhmPRDB60IQuOIf1RDxASPxm
         slZgADqbkKqIuvxuWEmZ23vGEkb+MfGQuUf0vJdf6DX2+hyv/f/j3smxqJfPA47iV+7w
         fnV/Y6qp9JQRLBWeYURaouK1qAORSVPHMDUuaea7YV+NWGTAB5+zHtLs0JylzzRpN4Zd
         HlcJ5U4UMVrEPtl7MR50FdI7uX/hxWQ82JJg7pKyvP/R1iLJqg1n3IArvK3JPczx1b7M
         S5qwxTCLh895cbteCbZDIWEm+5JfW/liwCPtIEX7U00Qwl8hghooQeexSW6p7N6y+w8p
         0/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762793880; x=1763398680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrUjnTakXAhjUzCetAR0m4o3R3KIpOKUlQf3gmLgolM=;
        b=LbIMuTWhQo4XmW7UksJSrLIVIVbubCdXCjbipmG6NtjUs5NcetHl4WOGeYQDsztD/7
         +g2R3WtUrmekvOPtrx7MGvq0FZ/Ac29aJS327xSC0nxjAfdXm3z3MSE2/y2VG7FoUlNb
         Gh3oDuBMgXadDTPr9PgQdWUXhy5cWIR8sTdoqTMPIHraoiWucWR8ZYg4PFsyybkuxqyI
         mo3TXSyDlFqgN1DeD0TMjxZW2t5S50qXHDQ5TIHUGh0+/2oRNPG+AzUbUlWygzm2rplX
         xrseEYK3gDk97Xao0WMbXCSMHVc+Rwejrhh+bI5u6RdTt0F3B/gTolFB0by4NLBDj2GU
         wDJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU4UK4K77RFSRPdUT8mlyp+QR/IyTdWNWY/TPy3MNN27I/FZVl56PprUjOaiNszXINt4eZnthdO62u@vger.kernel.org
X-Gm-Message-State: AOJu0YzzKI2glBXB+tDdCpX5NKvpt5dXaf9yRGkfKifMlAoMR0xVdwZq
	OCrqqgONzi/+8caqTF7+pjJNYK64Yl/ZgaCMC9B0t1+8V9cAM3GR00l90WN8nZ40EIaPBS55cLr
	Htq1r/ltfqmSqXzjqR/id/yCCrIOGf1g74XU7+QfLdw==
X-Gm-Gg: ASbGnctTQ0BMJ81kmKMQ7QzK4lIT5jYpiQ2K6gL60+xXJitjpvef4WjalJGA0hryfxl
	3f8cNCDOKuUuWIeQIuZC6KVwLNGQ2b+uEzFWeUp6YbY0H0GeifuHd6trLYbs581mq573ZPs+Gum
	cu0q+AVZIHH454abQ218EAnek4kr/Idn+WpoH3ntqKedWT29E2Bvk8wvJmZosXM6VCjSplTAESI
	CIf5ceEUWl5wXXMuBWkMpruHshjZyjvM44l5kC0huP7fUbWXoHnDX88UH6KnpjKkfhnxz6Dh2wS
	htLTE2pO8lJQjHBD
X-Google-Smtp-Source: AGHT+IGZ2hmsCEnrLKC/NZdMcRsSFhcLnVybLvsgXS8FrcxJdKYTw8c0QvLMaeSHjGAt6FxVSze0EYel51frgOEUO/U=
X-Received: by 2002:a05:6512:1152:b0:593:1063:938d with SMTP id
 2adb3069b0e04-5945f1b6d61mr2560629e87.30.1762793879972; Mon, 10 Nov 2025
 08:57:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106-reset-gpios-swnodes-v6-0-69aa852de9e4@linaro.org> <e0e81310332cfdc075bf13f66d7be712b42964ed.camel@pengutronix.de>
In-Reply-To: <e0e81310332cfdc075bf13f66d7be712b42964ed.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Nov 2025 17:57:48 +0100
X-Gm-Features: AWmQ_bkZgrAGAfJ-PeZMB30nsvIDn1ltlQZOczM8EP-iNuFYEeVCmNXK45hyn0w
Message-ID: <CAMRc=Mfcir56ZizXgZZpt4nQY234PA9jx3CQ24YCVQJFBQ7msA@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] reset: rework reset-gpios handling
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 10:02=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix=
.de> wrote:
>
> On Do, 2025-11-06 at 15:32 +0100, Bartosz Golaszewski wrote:
> > NOTE: I've picked up commit e5d527be7e69 ("gpio: swnode: don't use the
> > swnode's name as the key for GPIO lookup") into my fixes branch and wil=
l
> > send it upstream by the end of this week. It will be part of v6.18-rc5
> > which tag will need to be the base for the future immutable branch
> > created by Philipp.
> >
> > Software node maintainers: if this versions is good to go, can you leav=
e
> > your Acks under patches 1-3 and allow Philipp to take it through the
> > reset tree, provided he creates an immutable branch you can pull from
> > for v6.19?
>
> Now that -rc5 is out, could I get an Ack to create an immutable branch
> with this series on top of v6.18-rc5 (and merge it into reset/next)?
>

Hi Philipp,

I assume the Reviewed-by tags by Andy and Sakari under patches 1-3
make them good enough to go in?

Bart

