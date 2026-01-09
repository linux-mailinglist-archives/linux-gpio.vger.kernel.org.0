Return-Path: <linux-gpio+bounces-30343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C479D0A2CB
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 14:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 705A031EC5D7
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 12:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9B535CBD0;
	Fri,  9 Jan 2026 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFYdg3WC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EF635B15C
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 12:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963110; cv=none; b=uc4KwPRNwoLMiLKI7Gv/byYnKWL+iSddMvLNdaEtUF/Neq14GBP9wHWo/qEnVPpkIOeTRR+FtX9dl0bUezpXbeeFFK1cTKtzgX/ue+nV9r1b/YhMwMcctfeqo07D6CxDzhiIvh9gsrmvuIKIOPGJQMGUTQlext6REnfgmX667uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963110; c=relaxed/simple;
	bh=b2pdfqBM8QcOuodTV2+EEKDjVt4RtMF2UOfs35NWCzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/jEb/Lc3OM7YnzdPe0j4VAL4041HW6fn3cS4yx5jGKI6ETM7G0mczqAh9MMvkaPNr4gWHxrVpOk/UTwP93epSJzUZ/jhsJDaHMk3O5tT5Qpa6p3N3fejVvy3CblvfTLEga3OIi2jHQlv/Zna5yY9sLkjy1zcEGjz60yFF35UJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFYdg3WC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso34503275e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 04:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767963105; x=1768567905; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wzhZ6qnhyB+hMkP+k7TywINSr9e1/VcrZMD9Hv7Wg9c=;
        b=FFYdg3WCgBIyCL5HmJm7P3u0kypDKbCo9XmFC/oaMQKVOl2Cdhw8ezCEbR5AcMGZmz
         JXMcQ/6qEvkafDc9hddjQXbi1hDW5NUd7pSk7MGgmFixPBph8LcVYEENMNoorp0gmfgG
         OBKYrvAYdmnt34X73AHaGvZ8GzzsFMkxY7GLkDSgxUzHJ7Va9jAVdd/i20JQKjQHYqsp
         CB7u/VeewJRUGGnvLz5FF1XRICVTIcGiu2dVz0GPk6fIAhiyfzvIUxd5K74DMKWLWMvv
         IDSdynLJU12jVUVNPklN8jwjWKe+4bzkNMvOOlhlmb6i5Ojqz7xi9We/YNfJCCCUnbaa
         ay/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963105; x=1768567905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wzhZ6qnhyB+hMkP+k7TywINSr9e1/VcrZMD9Hv7Wg9c=;
        b=DPmgRSejiGECraGIZC1aOTz4b4lnWpAdljXcUYIgg4y86Vence3AqoLu8uAF3ozbOp
         DgDJEGMmHDb6cdi138nOIpihq86njcndTrUJViNu3bTE9KMa+jwxRETjURD0y9LkSmUu
         h1fNJy+PPQnGaNQ9iwr17DJVAL6614nTT0yQoNUKS0fWrQ4CgGBzv8gfM4OyTfeJGad1
         bmc5nnwjZqh82afHZMPI7MKZUSv6m5b45ZkoCYDkpgK5UiNkhZaqNOMdf/6zr1SGuuYH
         Ls1wrDxir310oiD+bw5a39a6NwJTNIA5qzyNCv768lkw/0SWHGv6A7YJ0a0iWoUlU29p
         /Ywg==
X-Forwarded-Encrypted: i=1; AJvYcCVeNrwcwe6XmPVd7xl228R4+3S3ALfG2CUawCe5O87CsSWEQfX+mqEbsSU9Swaau/7Rm/PoU02jKfVN@vger.kernel.org
X-Gm-Message-State: AOJu0YxCw3HXxV4FPiNkq2mM80EdYTZIyNREc9ahqWDvWmBAoPjkz18d
	oFApzf9U3d6P2eoBMQ5eVKy+OXHZnoeEE9CQoMvzYWAmArcekCIydS3N
X-Gm-Gg: AY/fxX5ZfmRjOYuGopvaHV+7Gx+I1yhAw/cGCWJPZwpY2k27+XRcMPz9vEjBMUzsHjy
	2+MpRXR3tMWtEe37no30V76QGRb7iPunKGqSPCg5K5AZUhHBJOvd6HfslOTa9P19lkbI6/Acy+e
	ebpKJpLVzo88vMDDIQpRHC6Bxc/KfhyMh+KB6B6k0doHtL9b/Fst91da1gSPl1Xa9HL4QBjte/7
	XTIz2qg1oyrwJ3RRaSqnfYT6uaRGcbPw/wM+t6EBl7tj2/xijiE2ymTBwwailHADwpkLo8U4NVq
	Ozu/LL18QW3fBxou0CbbaqwqPTBX2wic2RqC1MTVYGLAsq0587cKboR4hdxLNOeSaRCWmL2+66a
	BMzLk+JNEQPMtMIxYVkrFfd3NW0VUHzY0UOptpfS5kNo/vvJo0N+jSEK3AS43tHo5S0o+vuSb9O
	xcYk4C8Udg8VAAdpVn8sxUxe507h6U6R1YXhTAVYuVSyZh7zhnGv4NIloTD5aT4bE6
X-Google-Smtp-Source: AGHT+IGcDcabrf0KiqabCe9igRWYL1ukIxgKapFHgqspyhXNU439sEDpU7Kdmj0l4SVed0DCTQbNxQ==
X-Received: by 2002:a05:600c:1d14:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-47d84b0a96emr108677495e9.7.1767963105326;
        Fri, 09 Jan 2026 04:51:45 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5e3sm22332156f8f.35.2026.01.09.04.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 04:51:44 -0800 (PST)
Date: Fri, 9 Jan 2026 12:51:43 +0000
From: Stafford Horne <shorne@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: Add compatible string opencores,gpio
 to gpio-mmio
Message-ID: <aWD53y15NuxrKGxf@antec>
References: <20251217080843.70621-1-shorne@gmail.com>
 <20251217080843.70621-2-shorne@gmail.com>
 <CAMuHMdUaO_PwWygW8qss47W_ErB4pm1Z2HQ+edvw1-x7ce7oKw@mail.gmail.com>
 <aV9o1LL0Ahip0O3-@antec>
 <CAMuHMdXYCNR0ANn152ghFExpWY_yZ5+kyFGGRwA+X-EFUvxZXw@mail.gmail.com>
 <CAD++jLm1u9ChqsftwvbOptiG3Qo2KWxPjqN2snOVuZDYuVST5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLm1u9ChqsftwvbOptiG3Qo2KWxPjqN2snOVuZDYuVST5Q@mail.gmail.com>

On Fri, Jan 09, 2026 at 11:07:17AM +0100, Linus Walleij wrote:
> On Thu, Jan 8, 2026 at 9:41 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> > > > What is the rationale behind using brcm,bcm6345-gpio?
> > > > Given brcm,bcm6345-gpio has 32-bit registers, while opencores,gpio
> > > > has 8-bit registers, I doubt the latter is compatible with the former...
> 
> Yeah this needs to be fixed/reverted pronto :/
> 
> > > I switch the size from 32-bit to 8-bit using the reg = <* 0x1>, <* 0x1> setting.
> > > Also the reg addresses of "dat" and "dirout" are different for the real
> > > brcm,bcm6345-gpio.
> > >
> > > brcm,bcm6345-gpio. Example:
> > >
> > >        /* GPIOs 192 .. 223 */
> > >        gpio6: gpio@518 {
> > >                compatible = "brcm,bcm6345-gpio";
> > >                reg = <0x518 0x04>, <0x538 0x04>;
> > >                reg-names = "dirout", "dat";
> > >                gpio-controller;
> > >                #gpio-cells = <2>;
> > >        };
> > >
> > > vs opencores,gpio Example:
> > >
> > >        gpio0: gpio@91000000 {
> > >                compatible = "opencores,gpio", "brcm,bcm6345-gpio";
> > >                reg = <0x91000000 0x1>, <0x91000001 0x1>;
> > >                reg-names = "dat", "dirout";
> > >                gpio-controller;
> > >                #gpio-cells = <2>;
> > >        };
> >
> > Exactly, the register space and register widths are different
> 
> ...as proved here.
> 
> Stafford can you send a fixup or revert patch?
> (Only need to revert if you can't make a fix quick enough, which I
> think you can.)

Sure, I'll send a fixup to the devicetree binding and a update to the driver to
just support opencores,gpio.

Hopefully, that can be picked up in time by Bartosz who has this one staged in
gpio/for-next.

I'll send the 2 patches as part of my series for OpenRISC multicore fixups as
the devicetree's I have added have a soft dependency the patches.  After/if the
patches are pulled to the gpio branch I can drop them from my queue and I'll
just have to make sure Linux merged the GPIO changes binding updates before the
OpenRISC updates during the merge window.  Let me know if there are any issues.

> > > The opencores,gpio setup does work.
> > >
> > > Now that I think about it, would it have been better to just add opencores,gpio
> > > to gpio-mmio.c compatible list?
> >
> > I think that would be better.
> 
> Yes this is better.
> 
> I should have seen this, I guess I was sloppy :(

I should have also thought more, but I don't do this often enough to remember
all of the rules.  Sorry for the head ache.

-Stafford

