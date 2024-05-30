Return-Path: <linux-gpio+bounces-6956-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DAB8D4D33
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 15:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8E74284C72
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 13:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3B4176231;
	Thu, 30 May 2024 13:51:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ECE1DA53;
	Thu, 30 May 2024 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717077070; cv=none; b=SJ2FbEQCofbWyGMx+j8yeKxjR1f7/oZBxs4fhZ4rSYi/wGjl2wEBpSLTe4sq+ABFDi1/JOLsm8y3v//2IMjnegd73eeFnG9pTeVy2zq8QXGLbREEBkNIB8y3u+1vRghhbCoi99RCNupL46FDtT5WNQU4onvqaSoOWDiAwvaULyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717077070; c=relaxed/simple;
	bh=AwfheB8YvTRY6Oj6aJlK6shjFou68IRyTgmwVHSTJ9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdF5TemMxdL8LXIbfe0+RJLqdDIOIeZlKXrj8KTXDHT/REdwdZK7pleMRmwygbm9Mr6EENiQxL4iwkIibBlBwam+56aL3zJavQ27Ah0sHSxokVHAGiwH3J8LO9a3FbO+OBz/kuM4IqhPDhwEhl/1VdepUPc889FR/KzYoz7oz1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfa5b9274feso1018557276.2;
        Thu, 30 May 2024 06:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717077067; x=1717681867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T20NehVNKoFFwjOVqsaNMSQgwHMrrhnMmNO218IGYgU=;
        b=amfifomLm7idxTsMHFo1f4wKPloMb9NoMJ/av7YboZ+JHiNl3QWA+dQiWTfdU0haK1
         WcSFFDa7QOy2ShieG8FUms4tpahuB9vao/HJNJ+bgUzKSytdqhMLBt16RqlQy4FPVBkb
         QQQ+OmMHkDVKQdwSxk0pF8yv+Y/cW15AVvVTP2X5u6k/XaXdwT6qhWM+5VSfbHA5YqKP
         q7Bj8SwEbGAtXlCt09TdJ47OgGuO5eZXZhf1VXixcF5UZu1QAkT0UQNxuYhZwVkFm0HQ
         boYkTCERmMp1d31VSG5gHty6u8c+9M+9h2jhdFTsmCszwl2LQS62sWjvaOmdGbb07KCy
         NmlA==
X-Forwarded-Encrypted: i=1; AJvYcCWvCSrce3lK0xCaerOmFaPG/ijDTMUOQq1GsJKmD8Fz0WCKZ47GqfcZZrTa0KQi6Z2zg9tHX4LJ2Q2J1rYdpJ1ePllBbogQ9lbKj7zVIq1jargBrKbXSba4hwPEqhG4iQrbJY9Ucio6/iIgOn67ezDPuyyISPPKPYpKHSuQSWgLtgrGQF5nmKQpO6yWVcb4cd58o1Y2Ml2kvY8I5tRGTdlJim/4Rd8PQw==
X-Gm-Message-State: AOJu0YwQfz0sD5eMVVSd5ZArseWaYju1aXVp9VBUp0f68wKxMa5ah43O
	fvz0vKrE7KlWCLxd4tIAK2PWydgGsIZn1cKbAYZkpbswaJqXBSoPedQM9vMK
X-Google-Smtp-Source: AGHT+IGBciRhhIb2e1hDLIObx+JyUpUdeuVCLdkNLTtWKC45s5f+HV9N896piQIbOlR5+mBeeWDO3A==
X-Received: by 2002:a25:b18b:0:b0:dfa:57e2:8190 with SMTP id 3f1490d57ef6-dfa5a7db71bmr2359048276.52.1717077066988;
        Thu, 30 May 2024 06:51:06 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-df7747258e3sm1875849276.45.2024.05.30.06.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 06:51:06 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dfa5b9274feso1018517276.2;
        Thu, 30 May 2024 06:51:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxuoWACqvmpvqOfd/8MJR44xUqsorc9jyoADbDW8AlRGK2ctLXYONdIyLGvP3LSHT1/yQpNDeErboRbPP3NSoQGXA6yVCZH3J3plKynhlYhXrh4h8hSpMm3ipUODduTgx0Qqs78Vy3MkiRjaQiSFPcePwKw6YF5XtH8x08O4DyjYh1rs2R5AcWHilLhqtsRBAbWyYThh9rsOdh4LwGWzhkHPLHs+hHeQ==
X-Received: by 2002:a25:86c7:0:b0:dcc:d694:b4a6 with SMTP id
 3f1490d57ef6-dfa5a5e9c3cmr2324044276.15.1717077066050; Thu, 30 May 2024
 06:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524094603.988-1-paul.barker.ct@bp.renesas.com> <20240524094603.988-7-paul.barker.ct@bp.renesas.com>
In-Reply-To: <20240524094603.988-7-paul.barker.ct@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 15:50:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSji2e7KCwBaHZpxnY6C8ok1XqF4A5Py8xe_G+nP=enA@mail.gmail.com>
Message-ID: <CAMuHMdVSji2e7KCwBaHZpxnY6C8ok1XqF4A5Py8xe_G+nP=enA@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: renesas: rzg2ul: Enable Ethernet TXC output
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 11:47=E2=80=AFAM Paul Barker
<paul.barker.ct@bp.renesas.com> wrote:
> Configure ET0_TXC and ET1_TXC as outputs on the Renesas RZ/G2UL SMARC
> SoM, as per RGMII specification.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

