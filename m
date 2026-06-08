Return-Path: <linux-gpio+bounces-38096-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PcWRFaTUJmpglQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38096-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 16:41:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D73657675
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 16:41:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hlVSBeYz;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38096-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38096-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01A9031A3FC6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 14:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B613D25A2;
	Mon,  8 Jun 2026 14:27:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5D02BDC0B
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:27:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928871; cv=pass; b=aSmJzVs99Q3d63Y3YknZjo2QBu9Rf0dNg94q/vi7Rx0BkMqENzu8oNQ8lV097yDWygGDOJ6bLw+nB/iCRNLjRb4SEPH2ox4jkjQRkkbiNoGJqtCxG4ikasoqDQgkws7Yl8RauDK9ziO1GBrAuIUZhQkg7WhXX9emeZcQXndZOW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928871; c=relaxed/simple;
	bh=uwOZ9vn4bIUBDXSnu9OhAIH9oU6hnI0FzoGlcpmVCok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g70R2YYmt7wzr1MP8DLtPlB1+IE6UyutCxBI17qqoTZ7tt18V9JLlP7iJQ/u5VDI+G/KiPHXfdfpWJx6uZaMD8zyqr5l4GlhCqzIXB2xFRmT7JSPMKtzhUTgvBjwywKgc6hIUltLSHcvmYG+2wdbBSrTdjAhY6lU12fq4l8jbSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlVSBeYz; arc=pass smtp.client-ip=74.125.82.182
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-307263ad0cbso5609923eec.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780928870; cv=none;
        d=google.com; s=arc-20240605;
        b=QMA+2mf3YgynoZXVXDOR9H0/fH360HtEYMuHMov948PoQVQ0k1Wugz6OpuJnocTip1
         dRtpT2NquxWwX2fad7hXgZowCKBy7GVkQXTCNIm+Yali1Le2Klvbgxo153hdl1jD6f9p
         c73yabVcBwO0KQls/83rtNR+QuQgxcatORC5tTqd4UJzQvBq2EoqN5jpjDGk5d0CLy88
         BVS8UE1XahDaY2tufJ/sdpLovE0PLR56aRnh4g01Np4TpovMqY2FQEMCEU/BQfV/bojx
         NpQPusPzmaAcWykIEnDZfrFbdofPtvYL77Fa9Pd3FSmAtMVQx3MygBx+OCJMGvO7M27K
         TODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9BthUXbZjRNDGOrLp8ndj+okgh0gOtohunzTVO5fK8=;
        fh=hwThVTnziSHqVau67vZ3ciMfkbWIlIt2GocCj0/4qGw=;
        b=fwkIIHYVO5yAF/VtthbAZ8ISkFhMWBFeTeBh1t7vofaB+WP/eonv1wlx9A7z0PQEwQ
         /LFspMOKubolztTrurE4bgdNPyb2wIMlt/UjbKRLc3fBF/K8pvhz236SeGcaQuN/rn+u
         VRT6vs3E5a+rTmLilyL71jfTSemAArlpnyK5+KF5oMhc+eTrL5J4bUcJWcJzcSdpI2qM
         Qt342usGoMNuPemKEoYWEAx7bIF+qxl7GNJq48FJO1J57j+QtPNkkp3VOAl04SgIMLta
         +K4vmTjDRvz3ssKGIh1ThHXm0JOSsEf0KsnPDJIcJzrHpkZCJ309J0hXD3NsSs7ppS//
         97QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780928870; x=1781533670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9BthUXbZjRNDGOrLp8ndj+okgh0gOtohunzTVO5fK8=;
        b=hlVSBeYzGdd9huk5kybERSRXAm98apsDogbbUBmCIYoVoMz0wJB8Vjfw2vohW12kHk
         yz8R3Vye8CA9lVGNoMUzpTSZdxp8o0Tf2rJLaVK5/DNxbamp9edsoX43krqAfQTxsoXZ
         vSc8jP8q+HpZpJ/tCefdY45Mym96TI/Fm21G2vhxlJeR6Fc6LpD/HaqNgkD3OSvVOzT9
         QPNhNPfJIKEhnuUjlmsxoJtSZCplFJOm+rPzcYqFODLUZXJal/L+COIZvRmgYc+nva1T
         NRbCsF0ZgQ+bBtbQntUpEDjE+o5alPYj92nZR3jJRu8W0zAg4wabb7xNFA2IEj46DAS4
         oxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928870; x=1781533670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9BthUXbZjRNDGOrLp8ndj+okgh0gOtohunzTVO5fK8=;
        b=AbCM+S0q2LEW7YBkBGXI5V+gJWev3IB1t0K4l1igHBGmtuWbBlSyzKpa8ZrS0JEnvB
         qGqqqq81QsGohp3Z7ZLwwbFRDJCI3QM8cgTC43cbp71liZEa9AFWjV+m6wZDTXwg8Tic
         zpfFdTS0PJSeUMRblhtbFhtQnhkYytdZ9ZKoo3B2IPp0hlwBwu0O7OVkAtSwLKwFoXp0
         VA7E/rxnX6L78/4BBDDuX/7uQyZACK9dpAg+HVPJSnaZph5ywhA+yuTjf+VGCeXRx1QQ
         S6E0F2uhKPYemKCMswVacB/kMIMHG3t9zRygwa1eHCDeeQ9R6kew0gSmR+p710UhqtYn
         4ksA==
X-Forwarded-Encrypted: i=1; AFNElJ9FrT+j980EPJirEjIKlAcnfMuh0ppK+3wvx79U4FCE1vblxMyCiRUL5ieujiinTJaADrnAy+GXX62U@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0NFUcvdpvyHk8god47eKkpfgRJnzlXf9l8PxiTL03MtABxMV5
	omA6XaYWjXsXax0qu2tdzupLkcOmznMairxmFOrjJmkwhNIPGpsUdKXa4Oq2AVzslgcVjSJ+4ju
	0bzdogAnVNo9Xm2UjnX23vGBxZ1SPVnA=
X-Gm-Gg: Acq92OF1jkp53U9A/ibbK9o2fz6WYFLXCYlJilYM70iZqpVL0/RjMaRNIRYYrX7HbwA
	oXSGkpUJhEtlyPcxhjFdRpR0FqQCb6ZKH+cu1LiWnDSTVGDgzvCMlrCS305tbpf2YVZ4kcri0l4
	iF9Pi0ZmxwP2htelY83pP6Kgwc/oMEe6mWHT0gxwx3MKdjsg5sZrLOxql0SvPuegfaCA5gJXpBe
	TRppkT5wUxW4TluyU2dmlZKcrZZgBEaxTexs+C+tW+9QNbk9hh32YdW/t5fbc+xTN0jZlEc3Ede
	26+w1T6DDgnpCqeS5gfeuyeYdQ==
X-Received: by 2002:a05:7022:459e:b0:132:5d96:3e48 with SMTP id
 a92af1059eb24-13806741509mr6271422c88.38.1780928869492; Mon, 08 Jun 2026
 07:27:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602142513.2203598-1-sergio.paracuellos@gmail.com>
 <CAMRc=McWvPhKHKYe7SE85eMj5v-tabHyeNrhYXX1u-jph8usCw@mail.gmail.com>
 <CAMhs-H-TXyHCnojKATBzRoU106PW=_tdgag2m3weqmMphbRnSw@mail.gmail.com> <CAMRc=MdeyVNd9CZQid99sHoXQiGD=y9USCkUjMT=Sy3nERpAiw@mail.gmail.com>
In-Reply-To: <CAMRc=MdeyVNd9CZQid99sHoXQiGD=y9USCkUjMT=Sy3nERpAiw@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 8 Jun 2026 16:27:35 +0200
X-Gm-Features: AVVi8CcHdn8r7vAF8D4AHku_hRgE7MDV1mzfgHSYrT4J2A85CnQH9HOpbkX9KaI
Message-ID: <CAMhs-H-dnR7KjOZYv+rSt=n4MwPd5O1g9kfoP99uA7TQASf0WQ@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-38096-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,secretlab.ca,linutronix.de,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linusw@kernel.org,m:tglx@kernel.org,m:grant.likely@secretlab.ca,m:anna-maria@linutronix.de,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5D73657675

On Mon, Jun 8, 2026 at 4:02=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Mon, 8 Jun 2026 11:40:57 +0200, Sergio Paracuellos
> <sergio.paracuellos@gmail.com> said:
> > Hi,
> >
> > On Mon, Jun 8, 2026 at 11:05=E2=80=AFAM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >>
> >> On Tue, 2 Jun 2026 16:25:13 +0200, Sergio Paracuellos
> >> <sergio.paracuellos@gmail.com> said:
> >> > The GPIO controller's registers are organized as sets of eight 32-bi=
t
> >> > registers with each set controlling a bank of up to 32 pins. A singl=
e
> >> > interrupt is shared for all of the banks handled by the controller.
> >> > The driver implements this using three gpio chip instances every one
> >> > with its own irq chip. Every single pin can generate interrupts havi=
ng
> >> > a total of 96 possible interrupts here. It looks like there is a pro=
blem
> >> > with interrupts being properly mapped to the gpio bank using this so=
lution.
> >> > This problem report is in the following lore's link [0].
> >> >
> >> > Device tree is using two cells for this, so only the interrupt pin a=
nd the
> >> > interrupt type are described there. Changing to have three cells to =
setup
> >> > also the bank and implement 'of_node_instance_match()' would also wo=
rk but
> >> > this would be an ABI breakage and also a bit incoherent since gpios =
itself
> >> > are also using two cells and properly mapped in desired bank using t=
hrough
> >> > its pin number on 'of_xlate()'.
> >> >
> >> > That said, register a linear IRQ domain of the total of 96 interrupt=
s shared
> >> > with the three gpio chip instances so the bank and the interrupt is =
properly
> >> > decoded and devices using gpio IRQs properly work.
> >> >
> >> > [0]: https://lore.kernel.org/linux-gpio/CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ=
7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com/T/#u
> >> >
> >> > Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
> >> > Co-developed-by: Vicente Bergas <vicencb@gmail.com>
> >> > Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> >> > Tested-by: Vicente Bergas <vicencb@gmail.com>
> >> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >> > ---
> >>
> >> Hi!
> >>
> >> Can you look at the sashiko review? Especially the bit about tracking =
the
> >> GPIOD_FLAG_IRQ_IS_ENABLED flag looks correct.
> >
> > I got rid of those two calls (gpiochip_enable_irq() and
> > gpiochip_disable_irq()) because the driver "gpio-brcmstb" which is the
> > one I based my changes on was not used them at all. We have not found
> > anything weird related with that on testing. I do believe that since
> > we are using our own callbacks for 'irq_request_resources()' and
> > 'irq_release_resources()' we are safe here. Regarding the others I am
> > not sure, but the introduction of the remove stuff for the irq domain
> > is because there are no devm_* functions for that. Other resources in
> > driver are using devm versions so I think the changes are ok as they
> > are...
> >
>
> It's about GPIO core: a GPIO that appears as "free" (users can request it=
) but
> was earlier enabled for interrupts cannot be requested in output mode - o=
nly
> input works. Without this flag set, gpiod_direction_output_nonotify() wil=
l allow
> you to set direction to output.

I see. I need Vicente to re-test without removing
gpiochip_enable_irq() and gpiochip_disable_irq() to see if everything
is still ok.

Vicente, would you mind to test the following change on top of this v2 PATC=
H?

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index c36aa0abd0c6..a814885ccd5d 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -144,6 +144,8 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
        u32 mask =3D mt7621_gpio_hwirq_to_offset(d->hwirq, rg);
        u32 rise, fall, high, low;

+       gpiochip_enable_irq(gc, mask);
+
        guard(gpio_generic_lock_irqsave)(&rg->chip);

        rise =3D mtk_gpio_r32(rg, GPIO_REG_REDGE);
@@ -174,6 +176,8 @@ mediatek_gpio_irq_mask(struct irq_data *d)
                mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(mask));
                mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(mask));
        }
+
+       gpiochip_disable_irq(gc, mask);
 }

Thanks,
    Sergio Paracuellos

