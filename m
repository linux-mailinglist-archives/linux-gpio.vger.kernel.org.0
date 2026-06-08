Return-Path: <linux-gpio+bounces-38119-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1klbKYkXJ2oNrgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38119-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 21:27:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DEC65A0B3
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 21:27:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CBIKhrfP;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38119-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38119-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E73FA3024A4D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 19:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5FD3E5A19;
	Mon,  8 Jun 2026 19:22:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7B83E5570
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 19:22:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780946530; cv=pass; b=jO2twO2r3cJD7xzDYpaz7+oob+oHu+clQB0yTT/+dvbVAEREdmlo4hu/3qfXhR2nIbbMzA4nbMjNnCJzvShEt5R67Ty4+xuGx6j+/MncTTF8bpyHHTMCdLgpidVnRmXXIfwiIA5wL1sFSh22cvc6TgYZ0M3UZimvTqeLviaim9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780946530; c=relaxed/simple;
	bh=vvqmx5fZfciYrVXmLMNEzZFflVMn7AVWp7ii/Jo88BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alj8DWeSanCdQvxCe3NuuN/ZGmt6Bmi7bPO0juSQ0BLvabowhrTqWnU1EZpDdL4Kp5dRoQzfW7rq7Nk2r5yCbqRz0/CnytA+IAfQXN8N4J/FrtYlVhEtJnHBfrhThnfPEMHe7awRzGAscvTTFbCdcacjGAgIe9nRoa3SupANp20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBIKhrfP; arc=pass smtp.client-ip=209.85.217.46
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6c4a2458683so1656370137.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 12:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780946528; cv=none;
        d=google.com; s=arc-20240605;
        b=WI9ejQMxPBorYGhdYtEvHIqP6g4mgqg23EYtuReUCTJ47I1kAXK7AaA68n4WN7A3d/
         Ho9KCZKfewCKcAajuwvHhzDBkURGZ78wi3V3FUiJN4JRk9NNG4bSV+nEbFQg3NxBrgNK
         PQ8JlX2QcB6t5If8FqZaUFQiKSaSeVx7jBZAeiYAvkB0Y3R34KiPXyqmIwqcx10kuI2c
         /OJjCmpzuRvJCrXuEAapfYr6TE08jFOafbIeui4gkWwfUVPZ5YwA9uPLhrM+ugZvBpWD
         jlB+dm8lVLsAV1t7NeKt2ahTTTAfv2f9Y/hAcsi5XYc87Bj+t7DrijsX7ye6YScCGGY2
         v5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S8uENMn9qxt3PU527rE+aYOI6MtG1ShlzA6pMw4ojEk=;
        fh=2kg6YmpGlWA4m9lG+GmP6vpYBsf/w5cQ+sUjqcppa3Q=;
        b=DsT3rWrHPa+NzP00mGcNWl0RbJAnE2K/ltIZALOqkYL0ySsQvDz2KB+19dtTFAcLoI
         LE+6WZih3XWkzLAEcKycppTEcp1ycsVqnE7Tu9+l/ZWxmdddZxQjSka6pk7Auda+x/H3
         SOPnhzDPNOoR0Gf1N3B4W4hSZ4PGvB2Oi8AHT5plhRDKifDf8k6s2HaYvbp5AWX1P729
         mOJ+5WcUh9nqDGR7gb17lBPSwhhy7fCLBPQDaPdykgFD6IOwjw1rMv/wIznQBn4MR+7R
         Sa4EtTY/ZLQqNaSlxFhBoJcNtVBWj6TZEf3LSZA+p5YCmOMxkKUgMzdNU8zg1GAXpG9c
         5iNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780946528; x=1781551328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8uENMn9qxt3PU527rE+aYOI6MtG1ShlzA6pMw4ojEk=;
        b=CBIKhrfPfkzet5jMcEbKRhIcMSEx4kaVNO4JQL96jX6rZ0EdKFrq5dTv33bcMr90x6
         L78Hani66C62gSxjrmwfhMwQvaLCQBI6fmePwFuJosl3YayYL4/6tuU/h1NbzNmgLmWK
         X4/H5y2cgGENMTIp8rZZVM+SVeRqiGZCfzqJt5UVywNOLk2SbCfvLbUm1KQ0/uNKIOmc
         pyUcydbNHKH2I4M0RxGMVBo+V8AOqq6EoQgjETplv1FbGMoJjQ9T6D+IxUKXcGkkQVL0
         qcIHnRt8cKHGODH2PKLpXjmhkxqvq2aVsKKlkAF/+awJtKLd6o60dzCi1ocSul+q2pDf
         gc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780946528; x=1781551328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S8uENMn9qxt3PU527rE+aYOI6MtG1ShlzA6pMw4ojEk=;
        b=RhAW3Arg39pyjtjYrzI0NNhp35zCJMpUNpiuqYOq82+T8330rserVpWpIqcd0qN9aO
         hgmUgvmqoHaEFXrxWYIBf+XXYgzThtsvruB6ncTexw34uHiGzbUcre279xvcymXs/1QX
         N70jHoFlVO48AijA2aIuOlo9WSdcuEqYCNVjnFSpu2HSU/rrx8xFj5k1VQFgZtW5HR8V
         tYOkGQdkDiHkB+Ohqoif9GpZkRcC327l3fEpSzuX6ZmBe3KHpzau7+YyuOu/QSDX7Mr0
         B8o9lWrB43oYKR1M/LXSZydIAbUuaK6CTs3S3Zy+YjxnoWyw4h2hGxv+iLqFu1Tzk8Xt
         chMw==
X-Forwarded-Encrypted: i=1; AFNElJ9VHxj7Ab7cOmNQLSMm1wYyKDnzo65qM9GHlcjlEZHzFYOhwnqwYS06yQ4j2FGle/6zjUM2byP3rnIb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo9nG+xI8UvEFcLsIKvM3I6IpdIufQgIJAYCjms8dIhKyYYNCa
	6UVhjKWndh5KmB6+tJtSZ5JswS/lbauqbwNvauCePd9RSJ9EKcJTOvsGQxPz/YPjj+2EdKg3N6m
	/WgG89HMCetC33y4iqrBVFNlFbZJnxso=
X-Gm-Gg: Acq92OFRuNawzY9oRkQgutLdUL3W/HeTU4Y5qTASrqJz+bTrJ1R8xEnC/BC2u6UHgyD
	IopNIPzdIToZsY+nrp9FWDEwU1QwzEuq14OO8Otf8uYXHcMxCggigxaaSLb62rMHcpyTwKIb9ds
	zP3oJRkbgD/0dcdJbaniinzUQODT33mrIE4wzWdWOaWSNXcRbhhbiKl1h0jHl6ISrp9Gw+i0nKQ
	eYLvaq4sl3E36f2sjRTwm3Mz7W5y62SXBvqxYbbgwI8jMX996J+rwYPKYPez4X0o8FK/4MjaDIk
	8dLVM2qLsN2S1s2F0Zp1DoOZKSu98t8RFFvIuDBv3q7paxnpQP8=
X-Received: by 2002:a05:6102:548c:b0:632:29a5:2b28 with SMTP id
 ada2fe7eead31-6ff02850d3emr8837837137.6.1780946527710; Mon, 08 Jun 2026
 12:22:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602142513.2203598-1-sergio.paracuellos@gmail.com>
 <CAMRc=McWvPhKHKYe7SE85eMj5v-tabHyeNrhYXX1u-jph8usCw@mail.gmail.com>
 <CAMhs-H-TXyHCnojKATBzRoU106PW=_tdgag2m3weqmMphbRnSw@mail.gmail.com>
 <CAMRc=MdeyVNd9CZQid99sHoXQiGD=y9USCkUjMT=Sy3nERpAiw@mail.gmail.com> <CAMhs-H-dnR7KjOZYv+rSt=n4MwPd5O1g9kfoP99uA7TQASf0WQ@mail.gmail.com>
In-Reply-To: <CAMhs-H-dnR7KjOZYv+rSt=n4MwPd5O1g9kfoP99uA7TQASf0WQ@mail.gmail.com>
From: Vicente Bergas <vicencb@gmail.com>
Date: Mon, 8 Jun 2026 21:21:55 +0200
X-Gm-Features: AVVi8CcAm4LcPEUrGVUQ6Za6BM6TucLoZljTHNFxkSm1-hKML3HPmYOB5Y1CRnI
Message-ID: <CAAMcf8CUyF6gr2V0GvwOnm9wE95vu6TQLaoG045xvT=jx5MSiQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: fix interrupt banks mapping on gpio chips
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linusw@kernel.org, tglx@kernel.org, 
	grant.likely@secretlab.ca, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sergio.paracuellos@gmail.com,m:brgl@kernel.org,m:linusw@kernel.org,m:tglx@kernel.org,m:grant.likely@secretlab.ca,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sergioparacuellos@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[vicencb@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-38119-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vicencb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07DEC65A0B3

On Mon, Jun 8, 2026 at 4:27=E2=80=AFPM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> On Mon, Jun 8, 2026 at 4:02=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> >
> > On Mon, 8 Jun 2026 11:40:57 +0200, Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> said:
> > > Hi,
> > >
> > > On Mon, Jun 8, 2026 at 11:05=E2=80=AFAM Bartosz Golaszewski <brgl@ker=
nel.org> wrote:
> > >>
> > >> On Tue, 2 Jun 2026 16:25:13 +0200, Sergio Paracuellos
> > >> <sergio.paracuellos@gmail.com> said:
> > >> > The GPIO controller's registers are organized as sets of eight 32-=
bit
> > >> > registers with each set controlling a bank of up to 32 pins. A sin=
gle
> > >> > interrupt is shared for all of the banks handled by the controller=
.
> > >> > The driver implements this using three gpio chip instances every o=
ne
> > >> > with its own irq chip. Every single pin can generate interrupts ha=
ving
> > >> > a total of 96 possible interrupts here. It looks like there is a p=
roblem
> > >> > with interrupts being properly mapped to the gpio bank using this =
solution.
> > >> > This problem report is in the following lore's link [0].
> > >> >
> > >> > Device tree is using two cells for this, so only the interrupt pin=
 and the
> > >> > interrupt type are described there. Changing to have three cells t=
o setup
> > >> > also the bank and implement 'of_node_instance_match()' would also =
work but
> > >> > this would be an ABI breakage and also a bit incoherent since gpio=
s itself
> > >> > are also using two cells and properly mapped in desired bank using=
 through
> > >> > its pin number on 'of_xlate()'.
> > >> >
> > >> > That said, register a linear IRQ domain of the total of 96 interru=
pts shared
> > >> > with the three gpio chip instances so the bank and the interrupt i=
s properly
> > >> > decoded and devices using gpio IRQs properly work.
> > >> >
> > >> > [0]: https://lore.kernel.org/linux-gpio/CAAMcf8C_A9dJ_v4QRKtb9eGNO=
pJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com/T/#u
> > >> >
> > >> > Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
> > >> > Co-developed-by: Vicente Bergas <vicencb@gmail.com>
> > >> > Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> > >> > Tested-by: Vicente Bergas <vicencb@gmail.com>
> > >> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > >> > ---
> > >>
> > >> Hi!
> > >>
> > >> Can you look at the sashiko review? Especially the bit about trackin=
g the
> > >> GPIOD_FLAG_IRQ_IS_ENABLED flag looks correct.
> > >
> > > I got rid of those two calls (gpiochip_enable_irq() and
> > > gpiochip_disable_irq()) because the driver "gpio-brcmstb" which is th=
e
> > > one I based my changes on was not used them at all. We have not found
> > > anything weird related with that on testing. I do believe that since
> > > we are using our own callbacks for 'irq_request_resources()' and
> > > 'irq_release_resources()' we are safe here. Regarding the others I am
> > > not sure, but the introduction of the remove stuff for the irq domain
> > > is because there are no devm_* functions for that. Other resources in
> > > driver are using devm versions so I think the changes are ok as they
> > > are...
> > >
> >
> > It's about GPIO core: a GPIO that appears as "free" (users can request =
it) but
> > was earlier enabled for interrupts cannot be requested in output mode -=
 only
> > input works. Without this flag set, gpiod_direction_output_nonotify() w=
ill allow
> > you to set direction to output.
>
> I see. I need Vicente to re-test without removing
> gpiochip_enable_irq() and gpiochip_disable_irq() to see if everything
> is still ok.
>
> Vicente, would you mind to test the following change on top of this v2 PA=
TCH?
>
> diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> index c36aa0abd0c6..a814885ccd5d 100644
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -144,6 +144,8 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
>         u32 mask =3D mt7621_gpio_hwirq_to_offset(d->hwirq, rg);
>         u32 rise, fall, high, low;
>
> +       gpiochip_enable_irq(gc, mask);
> +
>         guard(gpio_generic_lock_irqsave)(&rg->chip);
>
>         rise =3D mtk_gpio_r32(rg, GPIO_REG_REDGE);
> @@ -174,6 +176,8 @@ mediatek_gpio_irq_mask(struct irq_data *d)
>                 mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(mask));
>                 mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(mask));
>         }
> +
> +       gpiochip_disable_irq(gc, mask);
>  }
>
> Thanks,
>     Sergio Paracuellos

Hi Sergio, test successful.
I tested the buttons and touch and it still works.
I did _not_ test if the irqs are disallowed to be used as gpios in output m=
ode.

Regards,
  Vicente.

