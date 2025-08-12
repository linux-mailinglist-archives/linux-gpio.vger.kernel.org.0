Return-Path: <linux-gpio+bounces-24316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 717A8B22CFC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 18:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD1423B8BE9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 16:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADE123D7DE;
	Tue, 12 Aug 2025 16:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJrCRIlI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549F5305E04;
	Tue, 12 Aug 2025 16:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015028; cv=none; b=urC+f3B3VUjZZzv6OVNROBBQJxX9PaBdK4sGLywTqeXhTjjFcZnlgsIkKmoS8vr1/PbrPJ+iJsXplBdJ8LgsaIRKBLBQ5MJhTDqzC4asw8DIT2bW1gaIDu32RuzIO/MF5m1IRhK1lQoml3ZSPu5GDVygLQPZSEfAoo+KK2Q97p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015028; c=relaxed/simple;
	bh=uAwxI/+8TQm6g4UcoS0Gm7G989lzDT3m2cBmvlbzAaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeTYYoNt7EOafi6H/qkaVijn/rWgjngcs10DRYD947bFtq0Jk76uNQKWERaXXT8zCwS/cqjlorixwTSo9xJqmhLNfeEZbkSv/avPYafxTWlWh6aE8XlxmCM0zqBOFv8scDAeZ6eHF0vU6o5lyGQUN1bDhXsv9KlwnVltKJ8Bwn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJrCRIlI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76b77a97a04so5201680b3a.1;
        Tue, 12 Aug 2025 09:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755015026; x=1755619826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YScuhUX5evTC4ZV4Z1oDGSohp9xyCjozf3eB1V2Heq4=;
        b=JJrCRIlIvwxsQ4zQ+mTH7V2elXMRbNvduShiuxqIlynCDbFKycSuIzAo1Sl76l7Dgo
         FVR/csn6XJYhWBsXkZswvMVSdNhSdvh/r54N+Et5f+gTI3aXustr3BzYGWoYmTXrKoFY
         uINwEyGQM3ujOz3ZWOMAtDHO3REQaI4D9S6AHjSKjQSW5W6i+V/zFu9ldfJzhU8MOt9h
         HU60QzCWZkFqZByXVg4DBgjUSHqxvcxE96/meLooww582blzNJVaZuDmtGwmrs80gkvP
         a5fxIF/KPlLoaIwFCSoYqfLulUMN63STU+zzWBet2tIvsxPn+qcEtZqnUu5cvyiluxYU
         n/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755015026; x=1755619826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YScuhUX5evTC4ZV4Z1oDGSohp9xyCjozf3eB1V2Heq4=;
        b=t9U/2ZvUt9Jr3uq0CZljfKVayqIuzpz9r2VZZ6qm62+ZeiOca2VMHq/Ff+6qiWNX6/
         TKPc5Ghp3m5BHjyFcJsgGikSpAEQyE/3upQZgt/0OfSVlXlCgS0AAHlwwdRJzjcYjo0O
         s1aedjGDi31RA8f2bZOcpoc8+mkZM1ExoT5e4QDzsxAVbmyGepZ9ZnFdHJmYsCejF1Lh
         4yaD72nvyDLsa20PW0y47JAUR+5pb9m0scruyI3/oV6mkmp/yiwDXycclLDV1fxrkoz9
         nuvs02sRneDEyKujdxjn8+3YAwHxS8otak87DZMd1SMgl/1kFbmqRPPuogIrnj+PWkE+
         Chgw==
X-Forwarded-Encrypted: i=1; AJvYcCUctJs7yx4psWhJhxWww6O5qYhKPf9wiApGmf2B4IgbTTIQj5UqJ85gaqVxD0CYhhfwygetxFSmyK4c/MNO@vger.kernel.org, AJvYcCUq61wREZUJQKrVljx8E4Fg8Lo8DBcqja/CGfdnu/dcGJ7nAuH8pzng/+aV8W6a4JvjkcEAeDvS/bXh0Q==@vger.kernel.org, AJvYcCWBSvzK6Ah9l0O5REJ7/H5UDa7C8V6NiDHzI1ICuMkgLOqJ7UQffwNsEmemgcbGOCOInsUxRttH/rE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfp6DtIOlX5FXTYiM6eephefNRwdz1TuTBzxSF1NR0BigkPYFW
	3jwb8OXTcp/8Hgv+tPbg15efkXtSnpx9r2QPKjInbnafKZfmC5cldOOa
X-Gm-Gg: ASbGncuro8BBhqicRTZLhjHaYsI8xpbZAbYOlJ4DS+LRZyGvg3E+QLPhs/daYcOhNbC
	ThNIVGB5u6Efzrc+31MesIZngzGzX2Sn2pLLM1+N2hE085ul7jhT0XFCEa6LV175hMiPPzQZYfv
	CLUhgUQe5Y43DemJyYI1fUZrUm06UkHGfSS+hBbl+nmRtkbHvLsQEov/s42VgbhSniQMix8lw04
	gZhOyXiv+N1pPp7gXISQGOILz8UCDk43+ofazm3i3crZA+nmv3ikYGL2AItgEo9aOLium8ktowk
	aTO2Aux1PJh9lx54jBC0L0biKhKgO55pQd4gjhw4OzBTVpQgGKeEnmPt60P1DqwcfjsaCgEOXRr
	+yJjdDGxMD3C5NJTagsWLXsCNngKaOMNUag==
X-Google-Smtp-Source: AGHT+IEEby0uQPSdwykVegwWI5VqNXm5qtBbqM3+Xlx3ZNFFH06MXPtJCFbb5q3+9bk9xf6R09IiMQ==
X-Received: by 2002:a17:903:f87:b0:234:c8ec:51b5 with SMTP id d9443c01a7336-2430c16b303mr3659245ad.53.1755015026381;
        Tue, 12 Aug 2025 09:10:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7933:7499:67d8:279a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a917sm306007645ad.116.2025.08.12.09.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 09:10:25 -0700 (PDT)
Date: Tue, 12 Aug 2025 09:10:23 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: gpio: add documentation about using
 software nodes
Message-ID: <mztcugybpsp47mmw4253djjuw5bpqlrvyb57youx2jt7gqkyj3@tifd34ke76i5>
References: <b52lpk2vqr4asp5iaqwcvcac3b6gen52rbu4cwy5kcnxszc3fj@6i77jr53kzje>
 <5cd1c94c-e122-45e6-8333-9eff3ae6303e@infradead.org>
 <csgmuaw2ret5qamcuwyenhw3sgb7hbso5dei7lshrz4pdga2tp@5mbv4an3q5cu>
 <b666c4ec-3aee-4917-86ed-bd65b5b7e051@infradead.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b666c4ec-3aee-4917-86ed-bd65b5b7e051@infradead.org>

On Mon, Aug 11, 2025 at 10:37:04PM -0700, Randy Dunlap wrote:
> 
> 
> On 8/11/25 10:17 PM, Dmitry Torokhov wrote:
> > Hi Randy,
> > 
> > On Mon, Aug 11, 2025 at 05:46:02PM -0700, Randy Dunlap wrote:
> >> Hi,
> >>
> >> On 8/11/25 2:30 PM, Dmitry Torokhov wrote:
> >>> Introduce documentation regarding use of software nodes to describe
> >>> GPIOs on legacy boards that have not been converted to device tree.
> >>>
> >>
> >> Thanks for the additional documentation.
> > 
> > Thanks for the review.
> > 
> >>
> >>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >>> ---
> >>>  Documentation/driver-api/gpio/board.rst       |  64 ++++
> >>>  Documentation/driver-api/gpio/index.rst       |   1 +
> >>>  .../driver-api/gpio/legacy-boards.rst         | 298 ++++++++++++++++++
> >>>  3 files changed, 363 insertions(+)
> >>>
> >>> diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
> >>> index 4fd1cbd8296e..0cf64e1f2623 100644
> >>> --- a/Documentation/driver-api/gpio/board.rst
> >>> +++ b/Documentation/driver-api/gpio/board.rst
> >>> @@ -94,6 +94,70 @@ with the help of _DSD (Device Specific Data), introduced in ACPI 5.1::
> >>>  For more information about the ACPI GPIO bindings see
> >>>  Documentation/firmware-guide/acpi/gpio-properties.rst.
> >>>  
> >>> +Software Nodes
> >>> +--------------
> >>> +Software nodes allows to construct an in-memory, device-tree-like structure
> >>
> >>                   allow { drivers | modules | software | us}
> >>
> >> although "software" seems redundant.
> > 
> > I changed it to "... allows board specific code ..."
> > 
> >>
> >>> +using ``struct software_node`` and ``struct property_entry``. This structure
> >>
> >> Quoting Jon (for a different struct):
> >>   Better to just say "struct list_head", and the automarkup logic should
> >>   take care of the rest.
> >>
> >> @Jon: ISTM that we need something in Documentation/doc-guide/sphinx.rst (?) about which
> >> keywords are handled by automarkup logic. AFAIK, they are struct, union, enum,
> >> and typedef (keywords) and function() as indicated by the "()".
> > 
> > Unfortunately device properties/software nodes are not yet hooked to the
> > documentations, so automatic markup/cross referencing does not work.
> > 
> > I changed this to :c:type:`struct software_node <software_node>`.
> 
> Oh no, that's worse from a human readability standpoint. :(
> 
> We try (would like to) keep .rst files as readable as .txt files.
> All of that extra markup and notation is noisy and usually not needed.
> Are you saying that the extra markup (as you listed above) is needed?
> for cross-referencing?
> 
> The original would be better.
> 
> (same in the other .rst file)

OK, I  was trying to make html output look pretty. If we want to favor
.rst readability that is fine, I'll drop the :c:*: annotations.

Thanks.

-- 
Dmitry

