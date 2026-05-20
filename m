Return-Path: <linux-gpio+bounces-37196-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC4aGHqjDWq10QUAu9opvQ
	(envelope-from <linux-gpio+bounces-37196-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 14:05:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D251158D3DD
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 14:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F219302084D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 11:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7956F3DA7C6;
	Wed, 20 May 2026 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="limEm/SV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375613D3481
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 11:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278314; cv=none; b=DZy/B3vxeNYjnkSzwce3WgwHF0CuejygAlLYLT5+qyIpw04/DpyPfUGvT7kzz0NFOeanH3dXw6mtJOysAaVwVGf02NOGjnwoqdAhhc1z2SUcM3x9U+PZekXza9iyTs4v/JV+Prm6NOEwjg5VXjDO7/sOKcWZ/RISwk10/k/nodY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278314; c=relaxed/simple;
	bh=0vNgCf73n70VxB9ASPwRzdqC5q0q9CzTew6xnMnG3+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRyh0yhNDFSuHqu20ZC3UFI8bGSjzjGpDKTrD9/KRHAICwrF5q4fLRsULmpGO1P/AIr/D6KQFmKs8aAZe5x44vW6v7D5p95HBK7heCYrcgK0bgXwzGfWWNxiazwVQg7QGMzOH1E8hmcqRg/OXShdNc+XRRi2w6Qg3O6gBx1vkpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=limEm/SV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0451F00899
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 11:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779278313;
	bh=vehH2H9abuOvxRcza18MkLT5Bjh4kPF+PMzMxEoh5tY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=limEm/SVYr3SSRRqOh3zB4tF4uV3W1wkcP3hrctRTNvhVh54oIRRFVVWmzFrkNHl2
	 zbkKM3yKMYiBT0Rg81eIV4zogkWxT+yQiFf9cRvkb2yiJwL1fd1ZUsWuAvrPl43+Nv
	 OySs75AOryn8SLeI2jrGCbRBOy/Oy850khd/fU86taeWZXmmLH6MLJLUbFjk4Q9Gvx
	 jNvySV02lGiRjMs41j2eYR5GusOfk5MoZCv9IbJt/P2vcrHt6tn4QCgG6+Rws+RPPA
	 qvxQdQUpmQOrrJVigM6icMNgLr9yI5HQ8teKpjNNjPGLL8klvST0Kp4KHiJWC6VPQQ
	 Fdz4FlfOWF3qg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-393c40246afso57177511fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 04:58:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8v5ck6te896gzayGEOET3KVoG1huLvFMwcsquiC8fyivMFN8hc5r1Lef57UjC+VxSFj7NxPzzbKImS@vger.kernel.org
X-Gm-Message-State: AOJu0YwV9SBUg2fU/abgEwSIIknvPcpEoH6JYZkjClXrRQbiLLrt5sRF
	SBp+OH1udqKDbZusehC2CHJ23xBUFMA+kfBWLiAGSbFfS50KiTHn6z04ZeYrpdTrxjKm1ibmFGq
	Fe1qzh7kwT4hW5ez0nmnSgdGS1jLYhKrYQmYkNlIw/Q==
X-Received: by 2002:a2e:a995:0:b0:38e:186e:350e with SMTP id
 38308e7fff4ca-39561a26af2mr76491131fa.7.1779278311843; Wed, 20 May 2026
 04:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520084911.27938-1-bartosz.golaszewski@oss.qualcomm.com> <CAMuHMdVZ=XUvJTGdDAjnkxgtw7Uvnn61iOy3XN_5XNZM2anctw@mail.gmail.com>
In-Reply-To: <CAMuHMdVZ=XUvJTGdDAjnkxgtw7Uvnn61iOy3XN_5XNZM2anctw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 20 May 2026 13:58:19 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeaLXv_e_Zw-CA9GW4jN8MCfitddT__+AmUUvw3_ynZtw@mail.gmail.com>
X-Gm-Features: AVHnY4KoGcBVdogay39flq-DJQhu1wQgdjdT9UI1XOLKTY__Ytxm7DU2T_eBEG4
Message-ID: <CAMRc=MeaLXv_e_Zw-CA9GW4jN8MCfitddT__+AmUUvw3_ynZtw@mail.gmail.com>
Subject: Re: [PATCH] gpio: aggregator: fix a potential use-after-free
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Koichiro Den <koichiro.den@canonical.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37196-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-m68k.org:email,glider.be:email,qualcomm.com:email]
X-Rspamd-Queue-Id: D251158D3DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 11:15=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Wed, 20 May 2026 at 10:49, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > On error we free aggr->lookups->dev_id before removing the entry from
> > the lookup table. If a concurrent thread calls gpiod_find() before we
> > remove the entry, it could iterate over the list and call
> > gpiod_match_lookup_table() which unconditionally dereferences dev_id
> > when calling strcmp(). Reverse the order of cleanup.
> >
> > Fixes: 86f162e73d2d ("gpio: aggregator: introduce basic configfs interf=
ace")
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Thanks for your patch!
>
> > --- a/drivers/gpio/gpio-aggregator.c
> > +++ b/drivers/gpio/gpio-aggregator.c
> > @@ -979,8 +979,8 @@ static int gpio_aggregator_activate(struct gpio_agg=
regator *aggr)
> >  err_unregister_pdev:
> >         platform_device_unregister(pdev);
> >  err_remove_lookup_table:
> > -       kfree(aggr->lookups->dev_id);
> >         gpiod_remove_lookup_table(aggr->lookups);
> > +       kfree(aggr->lookups->dev_id);
> >  err_remove_swnode:
> >         fwnode_remove_software_node(swnode);
> >  err_remove_lookups:
>
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Note that gpio_aggregator_deactivate() does use the correct ordering.
> However, there is a second difference: gpio_aggregator_deactivate()
> does not have the call to fwnode_remove_software_node().
>
> I am not very familiar with swnodes. The kerneldoc for
> platform_device_info says:
>
>  * @swnode: a secondary software node to be attached to the device. The n=
ode
>  *      will be automatically registered and its lifetime tied to the pla=
tform
>  *      device if it is not registered yet.
>
> So perhaps the call to platform_device_unregister() takes care of
> that?  But then it should not be done again later, if we jumped to
> err_unregister_pdev, and not to a later label?
>

No, you have a good point. Other users of this pattern: gpio-sim and
gpio-virtuser do free the software node in their deactivate() path.

I'll send a separate fix.

Bartosz

