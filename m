Return-Path: <linux-gpio+bounces-32662-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAkJMmbJqmlWXAEAu9opvQ
	(envelope-from <linux-gpio+bounces-32662-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 13:32:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 459B2220AF7
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 13:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F26E3084101
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 12:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E218237C92B;
	Fri,  6 Mar 2026 12:30:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6A738F93D
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800216; cv=none; b=ITrn28rLeT7tTPd7YORHb/1M68Q5kb+nR9R6xbpPnfmdo+Xb+mGFp1A+btphWJeFwZ2KNDNVnh5ANHcJLfKH3+5dY4KShOvwBoDNlFDvMvGH4RGrfXWYFJJSGwi9koRfxxxa+jy8zwmuTzubvjdK/eM95ESrRZh01Yh3qG7FV10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800216; c=relaxed/simple;
	bh=oUbryjVVhid9Zt+Zf7/gBLZ34rqFvud0SV96+cSbomE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0BP9Y7q5LKSx1603OKnr3LZscJtqFq9j7rr2bFdBPN8yKK6WA+W/50SCis8tO4Cxw+Hi2vegMa0L5bpJUP8ZxfIVXecTTW0pu5Xw6SCaydI0z7naVNWkQMCKt7Lzxhocg+f0d6D2MtXJM2OC4mIKgTxX78+jqcmE2eZOgFlC6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56ae58f3fc6so2744462e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 04:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772800214; x=1773405014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oBqwNtBq04gW3XhBM103o7jdyiuax9OBXrNtqd4780s=;
        b=X/6hCNMcWLLyNv73m/5o1ulh/Q/+pDVGLYkczraKZ1ETEpReCaFCXGPMDerNwhW624
         +1J5bcP9kWMjW5kbtveDTSHWS5cR61KXxZiea7QJutIWgv+AGPQEI3Yf2Iys5KEJbFMa
         u9hGZN54C0cbDcSARKLOpK+JxoeDMtkSk7RcJA70FM+SIh+FhnGhesuTmOD1IL3ofD5a
         TBmF8TFWV3F80vcvELTS5KuTVkvJwUYHe2lJVvXr/E1p6K0GPfRehNKdsFowjNAWUINE
         /uAp/NssgQUib6CeE5EH2P8iZ0gcPLqTp69X3JlMpvF9a+XKQ0Drze9qIpv16L0r20SC
         XhXg==
X-Forwarded-Encrypted: i=1; AJvYcCVotN8RxnqHkw/ksGQqBy5avpkLoki9Bhwnzpzy/S4wA61RdhEKh6jHiYM6ht4ayCvxN9/38vZYQxh1@vger.kernel.org
X-Gm-Message-State: AOJu0YwZhKwd/j1eLHGw3UR9JB3Y14A4Oug9ZgzxAyMbj0ANk4hTQK6Z
	sliStpu4QfGc/42Q0A/ztS890NU0QovR8w4FBjit+rCZtp1iYy0lCdXUHTeCnn/L5/Y=
X-Gm-Gg: ATEYQzxICGHgo8auePPA3OjHDVEQMCXKzn7tzf3kmZ/ye278VQwTFD3nFQ1/LCx187c
	frXI85FepeunHaiysB9HFURv4hVp0f+a5IXIa5OxImRIVmpcqzHTvg/PqrHtlteSacMgCYyKabw
	Vv6yjCtAGpqjPY7no73doxMC84fueDeHQHv+UmKE7hhAj+Tyg5D0inkYvjza8VgJXXVoVb/R9wJ
	+zSDGL/bWXEkL0kFpG1V9dyD5oKyr6O2Fb4P08+aMaiySsME2KqI07jx6JWEI27Dd9qRe1cf36I
	yuGywhPTSLE404S+vggDBH6aJdOQ8+uJpYExkdP/agdkT6tcpwI1BlEqk4uLjNwUT1T4GpHRH6I
	WJGhwHVQrL2OTzZ6/2MKjooyg0STd8OJjQLDxU6z2q8+LSUzip9tzb7J9uzTnjs1JlHSFZ/WNoA
	YsKq6ATeBa6UjN8l6mCGJNCTyFmoNw/3WmOrw86A4PQOCXb4HxUk185Bp11SmV
X-Received: by 2002:a05:6122:2189:b0:56a:9f03:1719 with SMTP id 71dfb90a1353d-56b07d4ccfemr674828e0c.7.1772800214425;
        Fri, 06 Mar 2026 04:30:14 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09a40cbdsm1253461e0c.9.2026.03.06.04.30.10
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 04:30:10 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94dd0f3c4b7so5560209241.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 04:30:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYAEGUpaFK6wmmkPHS3paTu/xm3naeCLxXp9aPoEJJA+seLjhgYbs+TdfLJP9awFW99tb0hWJ2y8nm@vger.kernel.org
X-Received: by 2002:a05:6102:3f16:b0:5ff:9ed3:448a with SMTP id
 ada2fe7eead31-5ffe610f26bmr765636137.24.1772800209844; Fri, 06 Mar 2026
 04:30:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rzt2h-v1-1-86472e7421b8@gmail.com> <CAD++jLkmywtWQfZzRYNSqFGNDGp6_MWq2k7YH_aiNGo01cWpqA@mail.gmail.com>
 <CAMuHMdXvS9QyL3UbfWq3KW=vfpLG8Bg4LfzGw9uYn0CfJSEj-Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXvS9QyL3UbfWq3KW=vfpLG8Bg4LfzGw9uYn0CfJSEj-Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2026 13:29:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKErj=4NziSVFQ+uh=zJC9dSYY1SXDJTGHQHAuwqXcMw@mail.gmail.com>
X-Gm-Features: AaiRm50pZFMCJnJ-Np5cwSu_gQrc6nNwiNWkdS8Bm7_5qaQjQmPkxb2yN-NcMvk
Message-ID: <CAMuHMdWKErj=4NziSVFQ+uh=zJC9dSYY1SXDJTGHQHAuwqXcMw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzt2h: Fix device node leak in rzt2h_gpio_register()
To: Linus Walleij <linusw@kernel.org>
Cc: Felix Gu <ustc.gu@gmail.com>, Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 459B2220AF7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32662-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.948];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:email,mail.gmail.com:mid,of_args.np:url]
X-Rspamd-Action: no action

On Thu, 29 Jan 2026 at 09:09, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
> On Wed, 28 Jan 2026 at 08:55, Linus Walleij <linusw@kernel.org> wrote:
> > On Mon, Jan 26, 2026 at 5:35=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wr=
ote:
> >
> > > +       of_node_put(of_args.np);
> > >         if (of_args.args[0] !=3D 0 || of_args.args[1] !=3D 0 ||
> > >             of_args.args[2] !=3D pctrl->data->n_port_pins)
> > >                 return dev_err_probe(dev, -EINVAL,
> >
> > To me it's a bit odd to dereference .np and then use other parts of
> > the args the next line but maybe that works.
>
> The of_node pointer is not used at all. The code only needs to validate
> the mapping numbers.
>
> > Geert will decide on the patch.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v6.21.

Promoting to renesas-pinctrl-fixes for v7.0, as I have another fix.

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

