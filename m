Return-Path: <linux-gpio+bounces-38186-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pYabBOEmKGqg/AIAu9opvQ
	(envelope-from <linux-gpio+bounces-38186-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 16:44:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8057466149E
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 16:44:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kbOFPCqp;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38186-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38186-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D77BC31AB672
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 14:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E822C354AE3;
	Tue,  9 Jun 2026 14:33:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB01C3546ED
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 14:33:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015616; cv=none; b=twNPsY2k/3cMyN53V2cUthK8aey2EtnLNFDze0X159L0fzuxjwMBxNWWLzMRDs6fhFHsH1q/4tFqC8BzJXIt2FwwKQkgu3E0ylWzaBW/kswULgVF7hix6epkNJURSqPOSX8beoxmT7pyryul6m3o/Imq2ZH4R/OKwMl16oIvHDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015616; c=relaxed/simple;
	bh=XrP8U0HXQw19/wYVBZXTbx1cKpUrl6kfyD4WIdWc5O8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbgEqbct6DEZlnnyQT5R1+xDjxOWUJigy2UkJF0O64h90t1IUz4NxuvZ/Ys9QZbjnBj5BR0gHP5510IF8IdtXnVoXXtX3P4X/qlwQF3rfGyWji8Io51xO0y/5JCWO3cusmn7QPMQkTfcBiSTDjAck1dd3jKTUc39zX2mkmSBCZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbOFPCqp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28F71F0089D
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 14:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781015615;
	bh=LteObBa2V8d+xpLZ3yqKeignRB3Orc8aH9VSuH4O6y8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kbOFPCqpPjq7gILXJtgxYK9k+hs471wEhMPu8fIwQWflQK/GzRdjd4RaviZdo7DnF
	 0pHof95OKqtqS+FhW9gh7Gou1d0ls1dZcQ4weIXZ1Ux0bQAEN6v+gs+a/FioBWT5fK
	 N7zFgw9Cnx2qfiMJP4EA724unzu2mmb2pzVlBzySZu/Q0Lhxkj5gZqMZuvbmbwN27g
	 BeyH0NvD9ozfO/z+11nFyBL+5W75gGB8jnPi21feXjGlZBfRbsKD1sc4sr6IXyXkx2
	 Rx9uSpZuuKl1ssMlf3afFMLdEaXC9/0bl1W8KHvUQIS6tBAc1Ye0PlBcabSv6qRXR9
	 iui8S5Wc3oavQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa624ff3cbso5689556e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 07:33:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8WQSUMP5TFJ2mGRpgJKVVgSlBqkyEeW09r7l9tmBQ6lOv9/lFdUZ6991Dx/Z8/oq75XlS9lTReI1XD@vger.kernel.org
X-Gm-Message-State: AOJu0YywOxADuQON4tipzhTL1eohLw8NvPwXswlVoMWx5m6JcM4nDYBl
	AQW/bUcguCJYTcquIjSfXwSe0Nfy2UNKKz9HfY0L5x03B7VXUIaXNN797Rd4ByPbppGDS56DLM3
	gdnwHS2AXsI/MOVJFPDZlgk1Yg6IwQS+KY1QLDX0/tQ==
X-Received: by 2002:a05:6512:150a:10b0:5a3:6731:910a with SMTP id
 2adb3069b0e04-5aa87babed3mr4198593e87.11.1781015614307; Tue, 09 Jun 2026
 07:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
 <20260609-gpio-hogs-fixes-v1-1-b4064f8070e7@oss.qualcomm.com> <aiggRCmJ8FQEMDib@ashevche-desk.local>
In-Reply-To: <aiggRCmJ8FQEMDib@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 9 Jun 2026 16:33:22 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdAH2GHhv_AeqYaiETy63X+kRu_nmoxzQxZrdNGgp7iUg@mail.gmail.com>
X-Gm-Features: AVVi8Cfq45nZjW1wJPTvefNquqHUgN-fIin7DvLlZJYeM-1MLGATBTRxPG8ebog
Message-ID: <CAMRc=MdAH2GHhv_AeqYaiETy63X+kRu_nmoxzQxZrdNGgp7iUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: don't process hogs on disabled nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38186-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:mika.westerberg@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,bootlin.com:url,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8057466149E

On Tue, Jun 9, 2026 at 4:16=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jun 09, 2026 at 02:17:49PM +0200, Bartosz Golaszewski wrote:
> > The core hogging logic uses device_for_each_child_node_scoped(), which
> > iterates over all child firmware nodes without checking their
> > availability. Before the code was moved to the GPIO core, it correctly
> > used for_each_available_child_of_node_scoped() to skip disabled nodes.
> > Check if the node is available and skip it if not.
>
> ...
>
> >       device_for_each_child_node_scoped(&gc->gpiodev->dev, fwnode) {
> > -             if (!fwnode_property_present(fwnode, "gpio-hog"))
> > +             if (!fwnode_device_is_available(fwnode) ||
> > +                 !fwnode_property_present(fwnode, "gpio-hog"))
> >                       continue;
>
> Red herring. the device_for_each_child_node*() is already "available".
>
> So, teach Sashiko to stop on this, not the first time...
> https://elixir.bootlin.com/linux/v7.1-rc7/source/drivers/of/property.c#L1=
132
>

Ah, dang it. Need to look more carefully at sashiko reports. I've seen
many false-positives lately.

Bart

