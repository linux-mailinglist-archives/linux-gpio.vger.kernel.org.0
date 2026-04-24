Return-Path: <linux-gpio+bounces-35501-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH/cGbtq62lNMwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35501-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 15:06:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D88FC45ED64
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 15:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED590300FF8A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB893BED75;
	Fri, 24 Apr 2026 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wi2wRom0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4233C1991
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 13:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035934; cv=pass; b=lyQGqyvswFxVbP4tm8GRHLdu94sZpxdrHcOaMvtXwWP/gnAhEpuCvYISmwtvH0abk4KNFlGRIbD9nWC/NgO8kzmrwLP5LXvESkHh3QI7ip9BaoVwCI/0kplrdxSKKg1qnB64LQBnS6U+s/MMNSLL3Lt0tdu4QwUkxtHMd33WG9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035934; c=relaxed/simple;
	bh=xP3uyFP6PCIyxBG3Zcx0H6OBWjVbS6/RbD4216wf3Ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eurrdg2x/Ul6/5H/0rqnZMj6oof+UeHHJksPLV4ay8D+5fGTHuPVN/4I8g/UYOmN3FGxDZo67zBnlDp82WCMvQfhIJ4XPzt8K686E+6pVAJPm5OHSCLr/ffYOWTWYxOaHkW2+q3sf0R9gw7BwYO50uspBWKQ2bFyJZ7sK9OvgxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wi2wRom0; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-651d692e833so8056580d50.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 06:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777035930; cv=none;
        d=google.com; s=arc-20240605;
        b=h/UgJPr7NtIHncCMXs5rUe4tS6bk1uJ6qNbWIhS/HKD5Lvg2AVrhdbVbyCj9/968Yn
         uFXyO0BuvjEYJTA8G16bsHj3Ia/LLI+/P05vVRhHJ5fl1BF2lspceTtButZnRfaSz0zE
         poXP+iM04AquAL/D6CVyRI7SoVN+csH6IBO1Mk77ExUJft8qK/JmeWaHKWgsnsZ7fXnf
         ukQTQDjbRQHOQpgk8umqrdgG4pDrdu1fe2rSVWWLk8/SwbCofhAQP5EvQuu2hrlGtQbN
         1DmHIZl1ln34/RAbUlKl7fC5TqJT87VdCAxjsqNFAOvHobr7FG8Dmcf2GUEgFwuSGW06
         CCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xP3uyFP6PCIyxBG3Zcx0H6OBWjVbS6/RbD4216wf3Ek=;
        fh=TpPiv9fI9kuV/XpuuZ1mj+D/0Z/duI51I27ywgeV9Ko=;
        b=kDZ2FJe+vK1b2XUKwu2EFHerl3T/vf/GfA13xGw54qWDhJhiPIZJV/H03ce/O8ye44
         bOYlDfl5elzfZdqgXqJj5gQv+GyLKXdPJg3pnBOAlgUcT6fxFkJcsBrSUYUw2nr9Q4d2
         +4ZUq5USnfiK/j8Fm4YuZyrjb22LkTAtenX9Nk7yA2rIDqPzuKpTP16VWp/MPbM2LKKO
         5YCJqCTOH9pmGZsyP0VpOaFFFefrJd9QEOoqwndNEOnpAQFHT5nwPtq0dkxWFr9iBa5j
         W3inb+zX4fZad13Wa1SNX+12/87FtZhSkkqSSdcG0WczSvjBeF9sQCJTjiUJ7lfMsJr3
         YigQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777035930; x=1777640730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xP3uyFP6PCIyxBG3Zcx0H6OBWjVbS6/RbD4216wf3Ek=;
        b=Wi2wRom0Z4FnlZ1HeePBuCtjTlbu5AJ+Jtq/VHsQQGqiekFDI480hgNH7Xi7jNMTni
         MkGlOL/bOD3Rh/iihk/IASe6/cNK0ajovpf+U2OrMWYrsMTVbyoeaRGDFGgkzMRzJ50Z
         4xl06cc2xQx1GC8dvjh7bmgtk84b3CNkexKA76bpFcXSIW69R874PhwKa3rjZbN2OM/9
         bcgsjiHae1MX+DXSARmiDiP6dj0UfHeu7iUDPZbo3uvyyhrtheGZHbxL6Olrw+QT4OE2
         EWjXz/Ghu1NdMXQyBUHCB5P5sKYsT47LIKFRMlybfRQqwFaIxy8foB4G1YgWBjnGAIX4
         f/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035930; x=1777640730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xP3uyFP6PCIyxBG3Zcx0H6OBWjVbS6/RbD4216wf3Ek=;
        b=m56mYo6+WhVBGcKMhX1gR4mfRnF0FCVWEOd4HOmKYnziKbPczskcCnF6P6h4VUIeZk
         pepKqL/5gnaJRVC7Qa6C4iKaE7i9w0u5McjGq/EfnPxeLKWA25cDxwvIOhb+8H5zCRLZ
         cB3TfB6XPdUnDe+XbnI7PRNUJRpApi0jRgsrbHOnbIMMR0aGV1oWKW22IIH7cMPdrpJl
         NLyDC2NwKOxB0VHMlfB1AKOUKmBONcjmXxdtIaBG5i/BOBuB3y8K3DycpKePT3w4vG7Q
         Y2TSQsh8Q2TwsVIGT/a+5SzE9OZcLk1LS6T9Jm5nzxVvvca++nhx7jEkpZgVEvP+K0Jr
         HI+A==
X-Forwarded-Encrypted: i=1; AFNElJ/QfprhNGIoY/nVEGpqrqit0/ud/+88O+cMlbt3jUSiDHqOJBGHXHI7gn1O62csA1uezyIyk4ny7Jfh@vger.kernel.org
X-Gm-Message-State: AOJu0YyaYvpBIWmLanh6DUtqwRmqk0nGpVC5hJgmnwxwvxyHUzHI6IcU
	p8AdEApxQ5U+x99ep8bFkJnrhSP5UWRosTn4rh/TGLWK7QYZ7aWRCdYMT4VjyvwoKyQoHRLybX2
	58FWBhcei1RiaFiJEiF99wvvhADYUFAs=
X-Gm-Gg: AeBDieun08smOWKlxTGzrnPS4mwG4/mBScx72cwKUIk/e9tgzYBK67gs3kDEG+t7PCa
	mPHA6NN+IQxMD8bm0U7vy3fyTVNeNqMN8HJS9x/vQUtUm91NF8j7lxThDYPF8hsPxokU0oxiGYO
	Jt8TBdH1zFCZbbmCFjgg1xOXLVjw23p2sIAkj8FWGWrTDoqZRhCAFFXyTAe5eLzkxav3XTeyVUp
	XcoIKv53G539U52VqC5ik48vQmC3uPjNj5vQlvx4e+bmhUZ1alLc6kb41wRoyxFCJIv5zPUewSb
	ADK6EUKEY42Ks3vJZzf3JuEJWhi/j5506S1k3HZryeA4kb1wHL+00LHODQbUI30=
X-Received: by 2002:a53:ac91:0:b0:654:acd4:9c1a with SMTP id
 956f58d0204a3-654acd4abbemr6065313d50.13.1777035930429; Fri, 24 Apr 2026
 06:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423223230.47001-1-m32285159@gmail.com> <CAMRc=MdQHKbs-Q9TWqoSa=NLk8c=m-afCMZ2EqGByPg0TE51HA@mail.gmail.com>
In-Reply-To: <CAMRc=MdQHKbs-Q9TWqoSa=NLk8c=m-afCMZ2EqGByPg0TE51HA@mail.gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Fri, 24 Apr 2026 08:05:18 -0500
X-Gm-Features: AQROBzCaIZ_mULZtyVuLGNn3d_JBGwJ2sBPStqLG3wLvtEeox9vUCw9kkCvZlpc
Message-ID: <CAKqfh0EzE5HTSJfJgYWKG2KC_-samjKVpDuBZ6cPsULWBnouew@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: Remove intermediate pointer variable and
 harden function
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linusw@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D88FC45ED64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35501-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

On Fri, Apr 24, 2026 at 2:54=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> Do you believe the code looks better with more layered dereferences?
>

I think some people might value the more explicit dereferencing, and with t=
his
we also won't need to handle the overhead of assigning another pointer, but=
 if
you want this removed thats fine by me.

> sprintf() is safe here as we cannot possibly exceed PAGE_SIZE with
> this format but if you really want to do this, than please send a
> separate patch converting all configfs show callbacks in the driver.

I can do that, but I'd prefer to separate the functional changes with
this one, so
expect another patch that fixes these. I'll remove those sysfs_emit changes=
 for
now so that the commit history will be clean for when I come back with this
second patch.

best regards,
maxwell

