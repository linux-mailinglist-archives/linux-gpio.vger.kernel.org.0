Return-Path: <linux-gpio+bounces-37571-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJuNCGC8FmqHqQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37571-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 11:41:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6845E1F1D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 11:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A3273028029
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330DC3EBF19;
	Wed, 27 May 2026 09:36:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF5E3EB811
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 09:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779874601; cv=none; b=m2eW3F5zy7ZFdkpavHIblr3EodjDSc4SZswiovDUSCXpduZXIW+HDAZRhAjPGFnIDsTjvXt39oGQ7hW99tYUve8bxODkXPDhzb5CHSoje1FyOh6auRkFqaUm5k96a1thluWCe4jmFC2GSuc+oadm7XX2psN2IPgdaYzHcLSZCwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779874601; c=relaxed/simple;
	bh=LfCe4LNPMVUu5fOQZ/DhPw5AXt+DrtW/uZ2vlE+ITCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5p8SZs/130GZvOhnqS7vfr108BYkBGNE5ufOucVBc+XHa6xebe2K1jW/CHUNY3A4ww+t7K/aZMt5Kd0u03Xkid0jKotUDmKrcLsIRk1dfxGxPbgF8tvUrS8sK+uvGA5Ny8pLofU1h0WYhAuJWt2Uxb0m0GvP2jsPeqNn7FohKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5774680983dso4020046e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 02:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779874597; x=1780479397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLue29P8rf5xvQmGeNSTeRRA/wr2HEJIYgSnfhWuBRc=;
        b=LCJxqOPRtc8qpc9h+eB2ShOE5ADWfRWqvB51WBkEZENliHSQpqo0RUtUiUXIoKIt8v
         rHanB25TjU8bycmio3MvjquRtgW3QeE0CviU9TfNo+P3yyLBCSimVn8G1BcA88MAMERI
         IfnVmWTMSk+M92IEQ8dOuCS+IuMfQmMRme6wUGS/mgHIL/3w0gPIlRJXXpBtWKil9mD8
         L25RDyUqPIWbvb5UL3vxPhN5/y6UTkQa9nWi4adPDBJyQ+yZvrzuyQY7g6XrM/ZMPVXh
         JkGEY89A5shA07FmiDqg8trEo45oPp07K11gCMF3mEPoLYnVBDgClXeVGk0z4AXCMlaS
         Dy7g==
X-Forwarded-Encrypted: i=1; AFNElJ+RShLaRXlAWdzNZ73JQDhXKv8kCkXmDOTWFixdYE1jyNbZ+NLxNwQkCex14dp82qpcnFJhKE8MptDX@vger.kernel.org
X-Gm-Message-State: AOJu0Yypbg+pPVNfEA/59nPxWnt1lfG2ZLlTeOkAwGxbvAAoKEtZRzBp
	oxfl25BdbEK++DiJqVPcF9es2ikmkFB986lmgzevmCvILFw8zro7S0W1XKEYIMzYvco=
X-Gm-Gg: Acq92OHGXRtYJFV+XLDS3Dxg2LCouJM+rK7ez4JIFbiJhcGSBqCpBQhLnWP2t1N90Aa
	3lFX/T3OIMVAAgCeQlE8Cr/MkPlbJxtwvKyXAu3Pd3Wg9xHbIMo3J7i4+M6qx04pRAseY7MTuqS
	jmMt++wHjwzX7V1TunfuAuZ8ZG6deYAzdtl6k7j0a5pjGl4vmtvh2SZZWo8pg4wKLVYPYMu1XCi
	9JqDakAX4233Mj7YGydOFc+ngqQveGuGVrvRNMC7+PIEV6l13m37Mdxo4BI4fjPUOoZuA/e+ika
	FhlMsJmC4l3t5VV022N0eE0jTiD6nMMqLOg+/vgOiSJCOPjrmRaloHTmOjRF2kzuONBsXfQ0phD
	7QzvWCBY3NKpYTyHVg11d8Sh8cTtqyQdG+X4Jb/jOBi+kxxfE3VXi121XqVsidC+MLYNyFaopSJ
	emBfvwvIIPvAlewwPWJMdA/IKSlrIOn4zKP/WE8ODQw01EmXKHBv+9rtjbJ+JduqtJ
X-Received: by 2002:a05:6122:f0b:b0:575:cd5c:3f95 with SMTP id 71dfb90a1353d-5865f1563a4mr10611882e0c.5.1779874597030;
        Wed, 27 May 2026 02:36:37 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f791f70esm19331558e0c.10.2026.05.27.02.36.35
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 02:36:35 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5752b27958fso3900138e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 02:36:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ztlmbINnRJlNe+KlTMAo31yahLS8X185MsaW0bZ+iPQtatISWp+oNy+MQdcLiyiQ82D7sGWQHNcYI@vger.kernel.org
X-Received: by 2002:a05:6122:ca1:b0:575:3b34:28b6 with SMTP id
 71dfb90a1353d-586624cee61mr10718336e0c.11.1779874595383; Wed, 27 May 2026
 02:36:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522102251.1723392-1-claudiu.beznea@kernel.org> <20260522102251.1723392-5-claudiu.beznea@kernel.org>
In-Reply-To: <20260522102251.1723392-5-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 11:36:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqe4JK9TibiaXO9m1k2YHqS0fYtN4O-GkYszSfMt1OOQ@mail.gmail.com>
X-Gm-Features: AVHnY4KKBDZVJSxF14oLw6h140lrQziFwBUZAfBfWP_NxcAjjTCmNb4Q9eatVi0
Message-ID: <CAMuHMdWqe4JK9TibiaXO9m1k2YHqS0fYtN4O-GkYszSfMt1OOQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] pinctrl: renesas: rzg2l: Use tab instead of spaces
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, wsa+renesas@sang-engineering.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sang-engineering.com,tuxon.dev,vger.kernel.org,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-37571-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.941];
	TAGGED_RCPT(0.00)[linux-gpio,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,glider.be:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6F6845E1F1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026 at 12:23, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Use tab instead of spaces to follow the same coding style.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

