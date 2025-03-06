Return-Path: <linux-gpio+bounces-17149-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDC7A54E45
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 15:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D08E16FFF1
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 14:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F04188734;
	Thu,  6 Mar 2025 14:52:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3362B146A69;
	Thu,  6 Mar 2025 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272739; cv=none; b=hIFgGONEFT9+QTkYCS/Ah6hZ0PGTNHZH04BRoCtyUAjoO/XsH7V/RAH947nTQekAH6GqAMTC3ezDDJLXTcZo9i3IpxVaLWFWaeZPpiFfzpz7ne2JZu7mUo5pBkSucTvsay4Zz0AwQJqvSr9wbtpSwrJFK2m+da3wp987jp0ZNKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272739; c=relaxed/simple;
	bh=MPIRZOK3oOBP+jbuRcmUNhIr+8TY9JapD1qCPYrBwZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t++Buk57wxvVca9pHq4jaVEiYtkwuNdmroxN1eVOeopuGnBK2IF90MyXYQK7blk131TC+oRIfok1JUsBWo8Y8oClq03rgClyfHRod2Gcc5sOUqUYsIWU1QvQvr2cK9EnyvJ3zwtr0F/hA2s98WlUakDZgtTQut6EdkJlXgxxm/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8671441a730so283086241.0;
        Thu, 06 Mar 2025 06:52:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741272736; x=1741877536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlQpiuuL9LIK/LxX/rmdmk4yepTqiryFLp277kZNAbo=;
        b=Cpz9lWCeTFbmfUX8MW/czd1UZKXarIdGn8zJN0uG0QAQ8S7LhGKhoc2nJz3pE7z6Cn
         gmHP5Ro6k/Ki6XvHqrvkQToICMZ188cORj/m6BJJ18qeZhsVATRawXbpv0ArK1ro9vId
         LhGSrs2VHJWPGXTak4ln33c8+6m6B8xHEVZAouUlL9FaTqvSjBY2grp8SIa5JbUaKPZt
         6RltkP/DDXdwKnuJ0AouYfhSQK8bSlJPfMwcdPMl2QeqGfMncff6bF0p6hvQw1Ql4oLg
         8m4tZf8bguQrEfxTu50yQQsVd0AgB6sseisciLo7rbX88ozIu0bCLCSuNpQJGYclBYsr
         cn0A==
X-Forwarded-Encrypted: i=1; AJvYcCVJGWeNnozudmULV8Fph5SVn39ycp86DWMJToxCqG2cA8y2YBiaiHmFql5c+5FbqCQqEAeEhB04O8NKUE0x@vger.kernel.org, AJvYcCVw+n+jHBmwRujj1bApUtg628WZt1l38D77ClsDEgypvA/yQD6w0qNU7aptjfmH2MdA6+owMgViegdN@vger.kernel.org, AJvYcCXD/5WDDIdmlIBmUszzAg8J79LoisZzfJ+XIPz+3hSIt22GI8cBtI/Oznba+uCwPxIJ4ZtQVWfsmCtnifiLT70xV8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA8L4YACj3/G6TiNQ9NV9uIoHRL/y8wC9MWu+SrBhmMTi8tw9w
	1UFftkFqTMIdk/EndsKrlKJlprJvcMAGyG+7+oxaIFFNlFIQBURmaICmEbiY6ZI=
X-Gm-Gg: ASbGncsJvw1hupFXkRNTBSTzwDYNsQvlOGD7ho2eY4WrbhBko95y37jsQaP3elAJO98
	66G62//yv/43eB4qgeX8Go03tUG3ku+Y/RFeefc3ty5E/fxTIfaqesCyob+S04m30KllfgtAvAS
	4wgDoJzOAqci7mnN25k8E3KaShcyJm5fLLP/UEUO9aRTpgbxbWAuN7vL8vxQ4vxd1q4wzoAZyzm
	lRJml+DICJPqw3ij5QLq1L9b1XWAME265VNWbV/6fuqrW52CRzWdpyrGKBBkBiBmO3+DzgGqE1t
	1DgPNCClGLqXczJoDV4ZwYeI37fRNs9erkzsp5crOwHdfFWcF/Ol0JCm8vTKSv/IcG0n670Jy5R
	1kpuh174=
X-Google-Smtp-Source: AGHT+IF9XnbUkLpwIx3w6T92j8LT0nxdqd9Kht44rKqt5DAXZYLdu0mGaPx/QNrEj0XDrpxtb//dDQ==
X-Received: by 2002:a05:6102:418d:b0:4c1:9328:107d with SMTP id ada2fe7eead31-4c2e29c1d4cmr5250966137.24.1741272735702;
        Thu, 06 Mar 2025 06:52:15 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c2fbca629fsm284477137.23.2025.03.06.06.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:52:15 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-868da0af0fcso302503241.2;
        Thu, 06 Mar 2025 06:52:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU54WFRIUDSBguve22P/KKz4CiC3Rg7pOsVzsHT0y2p8OfztF3t55fI9e753mLYwDWbExSKIUVJfzfk@vger.kernel.org, AJvYcCUCo/BMg2Y/khA4ZucwjHvdpBE44PJMW5nnFazz8WPy/As9Z81Sv8+T1muWrhpxTrXwb2yhAs7kuFaus324YRI1vnE=@vger.kernel.org, AJvYcCUybYX0E6X6T22+ZAxugeJ89lzwRAaTFBW0N0H/OL9+JeAvGf5SmWJ3mwd39rUWiEqaVm9zWxsSE5CgI9tE@vger.kernel.org
X-Received: by 2002:a05:6102:b0c:b0:4c1:99bf:5c00 with SMTP id
 ada2fe7eead31-4c2e29c51dfmr4753630137.25.1741272735210; Thu, 06 Mar 2025
 06:52:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com> <20250305163753.34913-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250305163753.34913-3-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:52:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1fCTX7guLkmbGi2UCavTc3zCLtX-0ogjS_7Ff9r1mUg@mail.gmail.com>
X-Gm-Features: AQ5f1JpEJs4mVBqBaWFP10cFaIeA8iKew02MwsaBweimWS5xf17lq_d250FYHik
Message-ID: <CAMuHMdW1fCTX7guLkmbGi2UCavTc3zCLtX-0ogjS_7Ff9r1mUg@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: renesas: rzg2l: Fix missing of_node_put() call
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 17:38, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> of_parse_phandle_with_fixed_args() requires its caller to
> call into of_node_put() on the node pointer from the output
> structure, but such a call is currently missing.
>
> Call into of_node_put() to rectify that.
>
> Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

