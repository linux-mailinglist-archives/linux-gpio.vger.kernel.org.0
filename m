Return-Path: <linux-gpio+bounces-7161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C931B8FCA55
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 13:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60DEE282867
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 11:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05BB192B98;
	Wed,  5 Jun 2024 11:23:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566C8149C77;
	Wed,  5 Jun 2024 11:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717586588; cv=none; b=s+orcvGg7w7CYVp24GDmMHkdJbSpr/o8eFAyoE8M8qNNOLCeUM8R0ahP9yBObyfR9+VFgno6KBLIqa3co12XhRbnsWGdQJR4vUSeYuyM3VPndszKBja5xJwDijQKbfafVt4K6uZP4epswYR1qoi59/809llhyyHeaVII0xsOb+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717586588; c=relaxed/simple;
	bh=7ObVeTeA0dD6/sQgMz/ubf9tk/YPyeBAJzAjFIdThBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDJZkyBwyVTuyHJo4NPBDeI8quE2KycnNAi+6XbcLgbXShTpBWiToM/4SjwIvJ/n1Tiv9x6HTEA+NQ6IfKODSAdVyEdo7zjs98vOh0vk5pQ0HUWoGMq4+yeVuov4VTcSjZSXAx16lEjXNz+1QgbZim9ef8TvlxH/wpcqLnFVz/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfa7790b11aso2152606276.3;
        Wed, 05 Jun 2024 04:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717586583; x=1718191383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqH/8AmH+rAGXcpibS9tY55Hpn1vNNn2+9ZaGbdtidM=;
        b=arsB1Bj+/NRks8C8/HhJDkLNYaHq85ocdyioF+GQTIkptQsdU2s3R2mXgwVl18vF3T
         zvyX2wXQ3iuD8d+cXlGLcATDuFbtBrRjJFI2EprZzz6EBIUZ/UhCSOsoUHQNMZKQVca4
         T1v7En5Rk2WQAAWL5IdGvRO7oY45LGi1GA8lQc8EIsIDH/n1e0YZ8cTm8/Tl6S0Rukkh
         l5MkYVwCXJqt2wLYRMAoKR/dkIpEJHeK7eEwqfumsZArk1fLmGS4q+t3Mqov9o/MtFw/
         B3bWM8W/JckxnbZbdSjmKOzTAYHX4yW/wu6iClkckntnxoFjZFB4Z/c06S/0vTR1pn0a
         FKfw==
X-Forwarded-Encrypted: i=1; AJvYcCVoo5hHnoj+Lc2cB9l7oPGyNf99g2TGzUfnOt0h2Mu9yZ+kMknFSTepXCoETFgqaSHTmNuN6DQUVzqHiTiDvwcdTEX25uEBcPhoErpBeYqB6o1dLho0XS+lcMcaEQ223Xx65lzO4hmnShQl6YOVxHTIctE7Ef9231ih09XxEBgVNew5lDQwFRel7Opx5P2ZzCajESPojC6+nMM1sYCyTWRXpN3a7frslQ/hUM0=
X-Gm-Message-State: AOJu0YyjwG7Aq9DtBeN1WmSUa/seXK29gR1IRvxlm4ofU6lpK8dnH79s
	jkVFmq06K2yxhOS+bUztFawRV07NcpNnA9Rw9j9dGFDSlwXL8JaNYwsmWG6x
X-Google-Smtp-Source: AGHT+IGJwFSpXqaIRNRMhXX9taQIoR9ixKZ0LA9vAUb9PicwKU/QtE/kWQwB/CfV2hOHRbN2eGFkZA==
X-Received: by 2002:a05:6902:2081:b0:dfa:710e:83de with SMTP id 3f1490d57ef6-dfacac77885mr2252599276.54.1717586583404;
        Wed, 05 Jun 2024 04:23:03 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfa6f03c2e2sm2636553276.19.2024.06.05.04.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 04:23:03 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-df771b6cf71so2233070276.2;
        Wed, 05 Jun 2024 04:23:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJiq5pABUOCil74ETdBVUByvBXqlxNOteLdgKx+jHXMAo93Z3chgx++eNtw6UJAP1wkdjSUdHEvxcbNm3FGFkfhhBeCdtyqIQBCEnHS2YkEK9P1FrIPHZSv3gxL6OXHzP0k/VNA2lqFLvaYFMkmZq7E9R2aDKUVLDx/fYZBLS8h4+KuQsLDk7TJ5mG0EZWZZ50X16C+mVjJtoFR5vaar31OSrhSI0kaJ8bNm4=
X-Received: by 2002:a05:6902:2188:b0:dfa:4e01:3bba with SMTP id
 3f1490d57ef6-dfacac4c982mr2496671276.52.1717586582484; Wed, 05 Jun 2024
 04:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522055421.2842689-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVN3O2O4VYmyXKAsUp=19-1=J8BU2NJ3PLaCYdgV98VyQ@mail.gmail.com> <20240605110008.eVmntWev@linutronix.de>
In-Reply-To: <20240605110008.eVmntWev@linutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 13:22:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMnuDSs5fg7iuciqCDSKidJ7hUxo5VxzOaZrUwqSjvog@mail.gmail.com>
Message-ID: <CAMuHMdXMnuDSs5fg7iuciqCDSKidJ7hUxo5VxzOaZrUwqSjvog@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzg2l: Use spin_{lock,unlock}_irq{save,restore}
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, linus.walleij@linaro.org, 
	didi.debian@cknow.org, efault@gmx.de, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-users@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Wed, Jun 5, 2024 at 1:00=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> On 2024-05-22 11:27:55 [+0200], Geert Uytterhoeven wrote:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-pinctrl-fixes for v6.10.
>
> I picked this up for RT and see that it is not part of v6.10-rc2. I
> assume that this will be applied within the v6.10 cycle once you have
> more in your tree, right?

I have already sent a pull request for it to LinusW, and it is now part
of pinctrl/for-next.  I assume LinusW will send a PR to Linus(T ;-)
in time later.

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

