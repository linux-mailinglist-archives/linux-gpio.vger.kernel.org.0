Return-Path: <linux-gpio+bounces-38085-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kky+Dz+OJmq9YgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38085-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 11:41:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4C1654AC6
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 11:41:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nygKq1dV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38085-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38085-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81C4D3013ED4
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 09:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08A93B4E9F;
	Mon,  8 Jun 2026 09:41:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4788D3B38B1
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 09:41:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911673; cv=pass; b=JCCxgjWTstUhu/NfN1ZjdFoG85eq/3asP7jRk6Ed1QhYzTSqbwyZG5dDcGAb5J9aaj4w2ILjI2bq/393vA+3gRdKoz+hBQfzlm4zQ2YbpzmFmYNbvzTKTcGDGUX9re4AQIZMEiLTfUz8wHmj1zwyKZ1KHHn+RXKvr55gLfyc1hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911673; c=relaxed/simple;
	bh=bTb+JiZ3QA7VqbWKqW4MfWeNwzCM7EpRKSy1xXfMm3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itRGmBzW5X9QC+5iNBEL7gKRluv85GmKFtMXvLUrfYZLT422QmlUMJZ+092nHpdYnVzZyAyOEaOFyXs/q9IGCdk5xwrL2xYPrZadXRdwrhOf7m1b1K6HVPWujA5f6DpIUQ59AtldNzqqBnGzQhwlLUvYNYDwLvCeZsGrPKP+FRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nygKq1dV; arc=pass smtp.client-ip=74.125.82.53
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-137dd4cc208so2422322c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 02:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780911670; cv=none;
        d=google.com; s=arc-20240605;
        b=Fqj+d11tCRoxXcYSYTVJP+2vDXjHKq/P2QzixqPkyZ30tAmbEzoxmUvmQphxbYQ7o4
         CZQ+jpouE79/VMbO7Hi7u6F3QHXEo4CI4oUn8QS917JdPXaJpuA8rP5qGPFjL/YFmWGK
         rbUYUZxIzaBgY7y6smwLXipue5dZy79/s70FYxVcw+s/gP7XFQ6OzRuxfd+wcTnUFfyC
         9Fdn1Geclyx8xqNnFOEKMopeajoNjchFYYwFXVFXO/6WAmhgDHwkTIQ0l7nO7H1+L0k7
         PQufTb2mYqLDkcX0Su0ZVRj39rpVoYVIqC31nMHxvVbupf5/pOLQLWp+KTjMoI27+xYY
         Bd9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=av3L3J1DFQzra9JPtxOt5NO79zQjlXKgSd+yoa8KKPI=;
        fh=Dqs65PT5hp26dJ3BgndasU85mgGUkP09e25nGUwKwZQ=;
        b=ZnwpXvUveZEFrqYgOTURzt9bDVWn9S4Biz2/AuRWI5o6Y+ZzZL7U9jl7tEZy7gNBRF
         6moHbHHFqfhVM5qgKV7NpqaOl0vRpavEjb0KgcqLWHLOw+qxdHelNIgByWsaNa5JEYZD
         2IW9a/628x3OLht0gpBybPeRxgM+Y9z4DkcVhtlH87oDHk9sLiEJpxqkLHM9Z1kdpmwx
         TaVjZiBui6RMTiQR4WhIkoKz/q5AMDXs9BTyp6Xeum4/LYhu8i6ZSaMth6teiQYgW32A
         TmhRDNkSBK1ajkJPNkbbQLgkN3LZRzw0PdL2APVFmUqB6ukDj+aPY5VruMvdJTDZiD/d
         k8kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780911670; x=1781516470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av3L3J1DFQzra9JPtxOt5NO79zQjlXKgSd+yoa8KKPI=;
        b=nygKq1dVMnhwpzrZWnuCqtVxWeSeXRVtfWV8k9O/xtuOYrXfXZ87iu1TYn6p+MXpvr
         z+qGA/0mbttSQDu/HeCefW+KWHI6OHFeC9b7l5EJdXcuMRflc5GBMvSdB4DNT25ipsNm
         2cpfaRrmdxCMpc6nJEaAn8qXAr8b6pXVrRdnmD7i0Dmq/9xjFekVS/ySSu8LeykAEpPx
         poIaQxMkqPZ+aA6SZiu6bIPD+fB21zhIH21tTK7LY2QXpsdtd5jPFO5jE4fQYBZKpP51
         c/nct+1JYAXUGM/nuNtOOpkfD3n6W4KSRpIzEzUqrUGodEtXs9kywHpy0C8D9cMT02j7
         Fu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911670; x=1781516470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=av3L3J1DFQzra9JPtxOt5NO79zQjlXKgSd+yoa8KKPI=;
        b=hnmu4RPwBBMkiLi5WiquZEjdb6EM52wTfkAFJP5Ac2y4baG14kLA7I9ur5QvK3gtSl
         tAiTD7q7bMP0TLirNTUWiZiriCAgnD6vbj5IkEX/jrM3HqUugrOFoEClcRo5jFI824bT
         OHkWWsTvtAdBN9veQWBDDu5tNOIsiE2Z4mfPZp/smQ7PH0i/MMelXRCQ/xoJSmJLUxAd
         xXcK5Pcvmk0Il6SGqTPKK5BV34V9aUGk5eD8l0E5u3BxmBBTy75AafQ1nd1q9IxiFVK3
         hsgawj/3JWVJw8LN95kF8a0oI/7Q7nOaeInNgKi4v5tIZAXqCaPtX/hQh2GTLaw0OpY2
         UEJA==
X-Forwarded-Encrypted: i=1; AFNElJ9SuuUjLqShYcAEdoOeFsl8FBpz+zF12IwUJy5nFmF4F0eJJiL5aYYQLmiJlgCMgDdm2wyJYyzfzJTF@vger.kernel.org
X-Gm-Message-State: AOJu0YyVcRlkGFqxh1oBiiUwqKIKKUq9WasKfQ48mF+uM5t8Sb/l+Q9e
	8o8mdlBs5nliSTZ1xr2ZdUBQNoA/jdPcvo5WPEk594T3AjxbEyWf2AoCfBf3u+YRl0M/Uf0yLhG
	qk1x88vYJOZ56izVZFIVBEElMI72iye4=
X-Gm-Gg: Acq92OH5otjv6xtbNob6L9sYalcZVmxhxgscBw+9mM1my5gH+5y/ZfGeqR+/Ay9GjhW
	ajJ8voWla2Lv5We0tChmHX9NW4KUmReE8O2dc3YRb4YyfPZ5hXEegIelZrIu/pbHVtn0S+mUYPJ
	4OPUv9sgPN2k8pv1xEz+O01fBHDzxxh5V/GeW48vvqz8rMIJo8ROa1T3wEWCJCBHBRzyR1OXOSu
	HhGXNz+NMhDQm65rU2EOfflXJNV+cAu5K3qZacCqOM1eJj7u4jPVREHjI4WBO91oHHQke9YBpGM
	cQzksmnskzrUyko=
X-Received: by 2002:a05:7022:48d:b0:136:4e2c:95a2 with SMTP id
 a92af1059eb24-13807c24611mr6699680c88.0.1780911670198; Mon, 08 Jun 2026
 02:41:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602142513.2203598-1-sergio.paracuellos@gmail.com> <CAMRc=McWvPhKHKYe7SE85eMj5v-tabHyeNrhYXX1u-jph8usCw@mail.gmail.com>
In-Reply-To: <CAMRc=McWvPhKHKYe7SE85eMj5v-tabHyeNrhYXX1u-jph8usCw@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 8 Jun 2026 11:40:57 +0200
X-Gm-Features: AVVi8Ccw3EsmEVYc8qErkqs9gnu78Cj0p9abB94BFdDhiqJQJ1r4gZSuEIR4_M8
Message-ID: <CAMhs-H-TXyHCnojKATBzRoU106PW=_tdgag2m3weqmMphbRnSw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: fix interrupt banks mapping on gpio chips
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linusw@kernel.org, tglx@kernel.org, grant.likely@secretlab.ca, 
	anna-maria@linutronix.de, vicencb@gmail.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linusw@kernel.org,m:tglx@kernel.org,m:grant.likely@secretlab.ca,m:anna-maria@linutronix.de,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38085-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,secretlab.ca,linutronix.de,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB4C1654AC6

Hi,

On Mon, Jun 8, 2026 at 11:05=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 2 Jun 2026 16:25:13 +0200, Sergio Paracuellos
> <sergio.paracuellos@gmail.com> said:
> > The GPIO controller's registers are organized as sets of eight 32-bit
> > registers with each set controlling a bank of up to 32 pins. A single
> > interrupt is shared for all of the banks handled by the controller.
> > The driver implements this using three gpio chip instances every one
> > with its own irq chip. Every single pin can generate interrupts having
> > a total of 96 possible interrupts here. It looks like there is a proble=
m
> > with interrupts being properly mapped to the gpio bank using this solut=
ion.
> > This problem report is in the following lore's link [0].
> >
> > Device tree is using two cells for this, so only the interrupt pin and =
the
> > interrupt type are described there. Changing to have three cells to set=
up
> > also the bank and implement 'of_node_instance_match()' would also work =
but
> > this would be an ABI breakage and also a bit incoherent since gpios its=
elf
> > are also using two cells and properly mapped in desired bank using thro=
ugh
> > its pin number on 'of_xlate()'.
> >
> > That said, register a linear IRQ domain of the total of 96 interrupts s=
hared
> > with the three gpio chip instances so the bank and the interrupt is pro=
perly
> > decoded and devices using gpio IRQs properly work.
> >
> > [0]: https://lore.kernel.org/linux-gpio/CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZ=
NOGsFP4i2WFOZxOVBPnQ@mail.gmail.com/T/#u
> >
> > Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
> > Co-developed-by: Vicente Bergas <vicencb@gmail.com>
> > Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> > Tested-by: Vicente Bergas <vicencb@gmail.com>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
>
> Hi!
>
> Can you look at the sashiko review? Especially the bit about tracking the
> GPIOD_FLAG_IRQ_IS_ENABLED flag looks correct.

I got rid of those two calls (gpiochip_enable_irq() and
gpiochip_disable_irq()) because the driver "gpio-brcmstb" which is the
one I based my changes on was not used them at all. We have not found
anything weird related with that on testing. I do believe that since
we are using our own callbacks for 'irq_request_resources()' and
'irq_release_resources()' we are safe here. Regarding the others I am
not sure, but the introduction of the remove stuff for the irq domain
is because there are no devm_* functions for that. Other resources in
driver are using devm versions so I think the changes are ok as they
are...

Best regards,
     Sergio Paracuellos
>
> Bart

