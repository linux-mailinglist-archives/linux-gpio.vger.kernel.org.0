Return-Path: <linux-gpio+bounces-16588-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AA6A44BE0
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 20:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6C1D19C5A4C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 19:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5340B205AB6;
	Tue, 25 Feb 2025 19:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TtrW52Ab"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807CB3D984
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 19:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740513422; cv=none; b=lSYyXjOiOYOKOE6I18mVmADxdaISPtVN0j4V1if7eTcv3weRHTeRnNlV/RU6ULcNvDOHiKWn4uk3BLy09aM6/IDdo3t9JcUpauKx1FvCWd859LgfPved6GaU7eo6qdon7ol9EoyR+Dih7n86nFuL3KiRWml6fGarlf+zTFIYkbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740513422; c=relaxed/simple;
	bh=RaEs746U4M6LbAWlud6skRYKEHY8N3q3LiMLGfTDMYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0bQFRfNUh0tP6Wlm9CllwtE4xtp9xbbqzJKPg4G/kAF/1HAUYnOrLFfAJhznoZxPA87S3mwwD05BGcOepu3L4/DzUtQjBVNer448R8oQnuTBr2u1DND3lzoqhrQxDvzNF719zB2cvOmrwGcVPDiWgJBFdUGAvTkjfPXMRYPA/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TtrW52Ab; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e5dc37f1991so5282502276.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 11:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740513419; x=1741118219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaEs746U4M6LbAWlud6skRYKEHY8N3q3LiMLGfTDMYo=;
        b=TtrW52Abr1XSQxWZg1s/hn/gH6ZKGZJ0RUYbSLjzZmK+bCFrziopTVE7ej61i02la5
         3fabPc974VKauOWT6Ybtjz/JuNLf7LnH5F4uwblDnoeP+1mQo+UOE7l2t4qpwM2reeQB
         Q/yFRcJenerttxg11oOy5QTChSohPRaLony8ECZBGp5KLt+p8iRJITz5GqE4F2AjZt2i
         9jmgNBiJHlZZP9yKjvPSHzoNC/vOirWT8ZmDe4uq/HYI9I67eYJPyT+Rm1TFyeMcNNxo
         dmFVv4dm1eO5GRX0tXj0SI/Qymw/69OeqWVajoPbjkTWZD+++skVa/zQOoVW99+K5+GK
         q9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740513419; x=1741118219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RaEs746U4M6LbAWlud6skRYKEHY8N3q3LiMLGfTDMYo=;
        b=qM1ZHSOFoWqdW7Fu4I78G0CpB6u5ug8kDGrhwkJEzH0nhvd9Kk6YVpwdQxzSMkvrRX
         DTOKthaqvn0La5rm7RjyGMcEsDDvZbqmE6pnwayNGUXwVGBcXeqN7cUnkKU5yNIEcTC6
         3A6V4Ee4WW955+i+iDq4tpQGxnANKpPCzRtBCVI8E7FJ1fvHarj8SN4KibbLJIlLw+C2
         JWelFlSo8TtfRyndrj7Q2U2a6V+4FwSIIqXIeQ5GwRoK28ltACLZlRYz8ZfnGkUb0iM/
         f69/3qC9sBYedjj1UD7BAjXoi7svAlzpSA4gQPEYDyPlyvHMfAFJTev8brhOoMqr72rf
         lKoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzFNWd7iPlF3Q5CN4YVXy2sEJGaisVV3JpuFJzGbg3cfLsipjjgdK9kBlnKXOn7QE2aD3Vdt969ORh@vger.kernel.org
X-Gm-Message-State: AOJu0YzOho5EDqwIWzzDEkz6pUb4sDOFPlai+iD9p80XAHDtwcTxMOCw
	0zRT9pQrbM1EL5fQM45D6G8wSlJ9flJH1DcWxlnVxHUCDHTdiOI1HFLX75/b1k/jRmkthOMFHqT
	8DYfV5AfPbn6pl6kl6HpASPt0Z7d5BpX9R6hv/zvOGhvk8LI1
X-Gm-Gg: ASbGnctvRlxGolvDbLcdCYR+yDa6slFpDldmtY3ExclQerCyBgfpciMDGCJInWHMXvt
	X7+hfqjtK1P+xdYRvLHV2IGbDJTCvAgd88Raf+GIADeaZfMtvr58gFavqoutEawusD9+LMROBCY
	R9Nh5aQnQ=
X-Google-Smtp-Source: AGHT+IGnQS+4CHYAD9qHEBaqebatWbAv7woMIyQj9yW3vKvjYHPSjMD27MtEZ0G/5CVy/AqsWMLoy303EhyF+eQ+YVU=
X-Received: by 2002:a05:6902:2846:b0:e57:87b3:d2e0 with SMTP id
 3f1490d57ef6-e607a4db101mr3509401276.3.1740513419304; Tue, 25 Feb 2025
 11:56:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com> <9d3f1ca4-d865-45af-9032-c38cacc7fe93@pengutronix.de>
In-Reply-To: <9d3f1ca4-d865-45af-9032-c38cacc7fe93@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 20:56:46 +0100
X-Gm-Features: AQ5f1Jpdv7pz6z6nze7rZuJ7TBqDVJHkdgNBuUoKjnid89I3Lrw_wiBK-Ih1etk
Message-ID: <CACRpkdaNP2so52DoeeQAE3imH8iyyKAu_px7V241p1rv9HUYiw@mail.gmail.com>
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 8:56=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix.=
de> wrote:

> > my only point being that when we add something like this, we
> > put it in debugfs where it belongs, and as illustrated by your
> > example, it is indeed used for debugging/exploring the
> > system:
>
> Why does it belong in debugfs? The whole premise of Bartosz's mail is
> to provide holdouts that haven't yet migrated away from the sysfs global
> number space an alternative _stable_ kernel interface they can rely on.
>
> DebugFS is the opposite of that. It may not even be available in those
> resource-constrained systems that this would be useful for.

This is in my answer to Marek, I misunderstood the wording
"play with GPIO lines" as "explore, develop, bring up" GPIO lines.
Not as "create products using sysfs GPIOs".

See my mail to Marek.

Yours,
Linus Walleij

