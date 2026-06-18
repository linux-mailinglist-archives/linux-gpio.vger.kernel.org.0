Return-Path: <linux-gpio+bounces-38675-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xIR/BRXLM2qFGQYAu9opvQ
	(envelope-from <linux-gpio+bounces-38675-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 12:40:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F7869F6BC
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 12:40:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XxfEbRQM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38675-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38675-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74995300E727
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8902D3E6387;
	Thu, 18 Jun 2026 10:39:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C8B3A4521
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 10:39:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779194; cv=pass; b=ayLfEOqNXsVDi80nhJzoUIez7QHGpc+xwNp8lmVKuBvTDTsSjbB+eGbOlyVFpW0Wd4OGRp45V6EAn1BuvlNjWuZG57ekZc+pjUUbG9UVM0c+Gx19OqsKe/AEs4G9jkvaeAll7DZTZ11R9yDMzHDbeEdQezWAz5GrFX1xP47ZztM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779194; c=relaxed/simple;
	bh=ehufqD82P2Xg2H7xsA1ovgl3kND+Ns1MIr/OvaHbXkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fa6cY0EHQG8QNzzlnFvy0HPF7tHm5d06wdTvFUB513wXFnxsguSAN7GB7RzSBbbMm8ngYRQuKXrPL6D5azhgL0fljqdTCWQNEGtjPrwqQ+1Q99qf5jDCEpH+d2gYh96Zd3l1sTIncOq7Dyjw5akZ8l9j8N7/PcSE6AJPlrvif/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxfEbRQM; arc=pass smtp.client-ip=209.85.128.173
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7fdbd0960b9so6941637b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 03:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781779192; cv=none;
        d=google.com; s=arc-20240605;
        b=cqDQRWOARnEy+qvjwPN1B/XEDqDz7BJwRy25n7aucNK37VhINmz8GLY2htDdwkXNrY
         pXOjiM6dpRLU73ilhjw6Dxo/GiXd550VR/+xIa9fnGgCKRiEVCyxPWcSOCIUGln4YoGt
         2ZZMKgQ4KaN20Se4c0x52LTM8Lzj2ywVEszwRlZiPAd0PjCVsrY3+yo/PFxbWl3w8dwm
         dNaFyU11QvwhnmoS5sqLxdo8Zp552utJpiGe8J4bidgJXJ96eC4fm6fkdnXWIc2saJ8A
         EW64fj0SHz5u7EyhcPdhEUNmZPuiB8nlLnTta5104KW7o5mEkj2PuUMZ3Les/0+1a0Be
         f6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xrAeCKH9AjGdzze7EacqS7shhI047hzpN7Ihbsp4CmY=;
        fh=whkkbIb4nyg9E8z19AriwYDu+kMNjysE+BcxZ9QRfzE=;
        b=OlU1KFMEqPHoX7ShDuzBfE09+IK3Hlvrkp3p6XGv6dj7dl+Cbql7+wXwdceOt6/f17
         8mr1OXsZK5WqYMTSEzajWZlfOfoS9Lan1Xes0JC1XNUPCgQXuqLBMP2ONt7aWt5/TMs8
         9vz91773YVUYDl4gdw57QhvnXPoulnKKKtkRrjXPJbkfVAlhEX13SFoNugLBHnEZEIqw
         LRus6RIrA4GtVZztY9v9N7Qg8CVzASPklAyx3t/Y1CkRaYBRavzU1svCJRARgaTsYYQg
         o1KuC/bPhTz2jqagdYqtBEJUKM6kjuPfTD+26yk05qJFBhds/QuFDPRSMmFaeRvcRh6H
         iveA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779192; x=1782383992; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xrAeCKH9AjGdzze7EacqS7shhI047hzpN7Ihbsp4CmY=;
        b=XxfEbRQM7JJ7GP6Jqv8/+j2XqaNHJvEKRCWb1UNq/OY328xnj7+h2RYFpHsgvBMn1t
         80TNIB/izjtDbvwG3220wgegPanOEPOgfDm641GUwg0w9WxvNBUuld3mUlD78geDw/N1
         H/DCTriWu4Zu0A8bzCt2hymioBjs3GaN698NxR94z7K9+4HsAy95c/pQfjR9MLnqyr1C
         eXwLMK9vCda+AZomKxUY5sFyKYAlvwVCEeHHMYoXLY+rQltmvsDYiQbAvj25/bVaa19X
         GkK0mCrGEaQlaMeH/uDE4jkjmwXvihB9/KEtDGawLJLbIvatY0gMqCdDt/iveqp87qRM
         KIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779192; x=1782383992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrAeCKH9AjGdzze7EacqS7shhI047hzpN7Ihbsp4CmY=;
        b=oRYpLXnf/acceynW5t+c+OEcpx0H26tl1IPX8tt7RLMRhzMgzaBLa+m85KvWgShUdP
         6KyPVBj+OPjkhpJ1r8DKhul30fLGWQhNFA3TwNxXm2gIvhk9zKefY1IhfxSHSy/FHZgV
         nmMHYr4r0SWVCnNq3gzTR4EH9OdPlCNF6QMMA2NBWSz1UDJgbBo0s3wkRGbHe45uSmO4
         fTH+WH7bBhwsUUVyDBeupY5L1XYpoj/gOsPEUcvVLEHtnyr1hmjvdqZ2jdNgnqC02t/1
         v16vSBhqPm8domzQNfwIkd8YSFrGOqg+miZk3XUKbMehjERJ840kBRuXLMAKbMsrEF9q
         nhjw==
X-Forwarded-Encrypted: i=1; AFNElJ9qfMn8pSNTix903BSQVpgDTQRcxKLlFHf2dkwoW2r8oRejjSHwKJjzeDqJflw0UB3ikvgq2JtD36O3@vger.kernel.org
X-Gm-Message-State: AOJu0YwIU3/sczEE6e2XijF+cb1EB5wsasfxUi34DmwQHN6KjOUFqJA2
	5HScl0GiZc+oO2JB5C2nYY8uJAHeOt3+JMtJVRUy3RCeM4lLnRWQzY9QFVfEDS4zl7lObK36/Se
	J15bWi9bB9bP9rhkp9s50k4Iw5iXfNn7ani0w+r4=
X-Gm-Gg: AfdE7cl1vTYasbONORSW1/o0Rh6cj39SfzGojdgkBVibN7hAp4PJ6RRZ2Z3cAWBiSiJ
	7gxIfQTaAQme0fIpKJPozyBtIZKWW517LJ7qSSqmeMHKIGL98+mN3sWSZ+dFPcYE4JlajOHvq1p
	/gjLGjZZwlgrixtm222miyK+pHCnZCME83pY4pmQqsy+GBe0bHksj6V0rtapt6e4TyzXEcdjBsv
	bSURVvGAGWkix5pD4rfcu3Q5Oe5awxb3dDlfSDOZyuwC2YP7wqKbiyPxwgVv+LvQe6iNPog2vvq
	GDccPyw/D+mPgY1kjlIfzOpUJtuTWvAqNIgU9DWYRTWlOuM1XH9tHj4dQJqu2E2AVKI+bz5B4a8
	BPS6mZ7yo8q/R+aSpH7edDKSwWvy8WcT5AJBGBNF0OCApbzBvb9zMPsaJRQ==
X-Received: by 2002:a05:690c:690b:b0:7dc:4b2c:58d0 with SMTP id
 00721157ae682-7ffc56432c6mr27548967b3.16.1781779191967; Thu, 18 Jun 2026
 03:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617065922.26004-1-hardikprakash.official@gmail.com>
 <20260617065922.26004-3-hardikprakash.official@gmail.com> <ajJobvY67HKufaTs@ashevche-desk.local>
 <CANTFpSUSKwTj-z0E2w3C_8ue8wANE+dHtDKboZ1+rqwN98C3cA@mail.gmail.com> <ajOWV3apVXOAHcYT@ashevche-desk.local>
In-Reply-To: <ajOWV3apVXOAHcYT@ashevche-desk.local>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Thu, 18 Jun 2026 16:09:40 +0530
X-Gm-Features: AVVi8CcfXuG1o-OqAlZC4gFYJ_kh1KlTBRRpIIDToe2l8F8PIwS0sHJDO8ZbHrU
Message-ID: <CANTFpSX+c0j754dekjax4cWZV5rk-B19=g2mi30WFddfw=212g@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linusw@kernel.org, nathan@kernel.org, chaitanya.kumar.borah@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38675-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:linusw@kernel.org,m:nathan@kernel.org,m:chaitanya.kumar.borah@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62F7869F6BC

On Thu, Jun 18, 2026 at 12:25, Andy Shevchenko wrote:
> So the question is, do we expect the resource_source not to be set at
> this point? In other words is there any valid AML that interpreter
> decodes to the empty resource_source? If so, can we ever have the
> following condition to be true?
>
>         string_length != 0 && string_ptr == NULL

I checked the ACPICA parser in drivers/acpi/acpica/rsutils.c. The
acpi_rs_get_resource_source() helper always assigns string_ptr before
string_length when the resource source is present. When it is absent,
both are cleared together (string_length = 0, string_ptr = NULL). So
string_length != 0 && string_ptr == NULL cannot be produced by normal
AML parsing.

Therefore checking string_length alone is sufficient:

        if (!agpio->resource_source.string_length)
                return 1;

I'll simplify to this in v10.

> You haven't replied to the rest, I assume you agree with all the
> suggestions?

Yes, I agree with all the remaining suggestions and will address them
in v10:
 - acpi_dev_get_resources() on single line, free only on success path
 - Reversed xmas tree ordering for variable declarations
 - Remove useless int ret = 0 assignment
 - acpi_dev_for_each_child() on single line
 - Use guard(device)(gpio_dev) pattern to avoid uninitialized variable
   warning and deduplicate the !gpio_dev check

Thanks,
Hardik

On Thu, 18 Jun 2026 at 12:25, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Jun 18, 2026 at 12:52:46AM +0530, Hardik Prakash wrote:
> > On Wed, Jun 17, 2026 at 14:57, Andy Shevchenko wrote:
>
> > > > +     if (!agpio->resource_source.string_length ||
> > > > +         !agpio->resource_source.string_ptr)
> > > > +             return 1;
> > >
> > > I'm wondering if we simply can move to strncmp() instead of this check
> > >
> > > > +     list_for_each_entry(ref, gpio_controllers, node) {
> > > > +             if (!strcmp(ref->path, agpio->resource_source.string_ptr))
> > >
> > >                 if (!strncmp(ref->path, agpio->resource_source.string_ptr))
> >
> > Could you clarify? strncmp() with n=string_length would protect the
> > dedup check against a NULL or unterminated string_ptr, but we still
> > need string_ptr to be non-NULL before passing it to kstrdup(). Should
> > we keep a NULL/zero-length guard before kstrdup() and only replace the
> > strcmp() in the dedup loop with strncmp()?
>
> Ah, okay, you are talking about the first iteration when the list is empty and
> we have to add it to the list.
>
> So the question is, do we expect the resource_source not to be set at this point?
> In other words is there any valid AML that interpreter decodes to the empty
> resource_source? If so, can we ever have the following condition to be true?
>
>         string_length != 0 && string_ptr == NULL
>
> P.S. Do not top-post! Reply under the piece in question. Also remove
> the context you are not replying to.
>
> > On Wed, 17 Jun 2026 at 14:57, Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Jun 17, 2026 at 12:29:22PM +0530, Hardik Prakash wrote:
>
> ...
>
> > > > +static int check_gpioint_resource(struct acpi_resource *ares, void *data)
> > > > +{
> > > > +     struct list_head *gpio_controllers = data;
> > > > +     struct acpi_resource_gpio *agpio;
> > > > +     struct gpio_controller_ref *ref;
> > > > +
> > > > +     if (!acpi_gpio_get_irq_resource(ares, &agpio))
> > > > +             return 1;
> > >
> > > > +     if (!agpio->resource_source.string_length ||
> > > > +         !agpio->resource_source.string_ptr)
> > > > +             return 1;
> > >
> > > I'm wondering if we simply can move to strncmp() instead of this check
> > >
> > > > +     /* Skip if we've already tracked this GPIO controller */
> > > > +     list_for_each_entry(ref, gpio_controllers, node) {
> > > > +             if (!strcmp(ref->path, agpio->resource_source.string_ptr))
> > >
> > >                 if (!strncmp(ref->path, agpio->resource_source.string_ptr))
> > >
> > >
> > > > +                     return 1;
> > > > +     }
> > > > +
> > > > +     ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> > > > +     if (!ref)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ref->path = kstrdup(agpio->resource_source.string_ptr, GFP_KERNEL);
> > > > +     if (!ref->path) {
> > > > +             kfree(ref);
> > > > +             return -ENOMEM;
> > > > +     }
> > > > +
> > > > +     list_add_tail(&ref->node, gpio_controllers);
> > > > +     return 1;
> > > > +}
>
> You haven't replied to the rest, I assume you agree with all the suggestions?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

