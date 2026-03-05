Return-Path: <linux-gpio+bounces-32560-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAVNNX90qWl77wAAu9opvQ
	(envelope-from <linux-gpio+bounces-32560-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 13:18:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DE631211787
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 13:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27038305B014
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 12:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6482A396D27;
	Thu,  5 Mar 2026 12:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qI+f/+r+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270DE377EB4
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 12:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772712711; cv=none; b=hpE6idmG8lYP0as1rPtjwdQlJBSwCN8iKsNW3mBAJ1ULGJpVXK06YXE7TJ73h1fOdeEqY/957BjikBFckhfutRl2rJgowPtg+e+fMKDYmY6cdWDSybUwrVSG57o9rbhkMTRNVDyaNdLfvZP3l6FajP5iPyNkIQLONnjWLr9msVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772712711; c=relaxed/simple;
	bh=EmZQCtLO8pRLYuoGPIN70oWLKnIAOaCwJQm16fFndd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YhBBifgamiwKVVcIc99u6JjwDJqpA74SVxGuMl+rex+uHlFOfr2BVtOsWzP7G3ztNIU552XL4W0mCDo9G7CbHZLw8tpKD90Q5DEKTrs0xA5QEoV/yoP7Dybg0QRRktWZN5SANE8SwWXNusjvIEONtEj4jMb1ghvA/Hr7SJ9Qx4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qI+f/+r+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70D4C116C6
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 12:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772712710;
	bh=EmZQCtLO8pRLYuoGPIN70oWLKnIAOaCwJQm16fFndd0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qI+f/+r+JPJl39K7jLG+gfieV35HpZjbpTrCIwcO7fexnvd6qZLnRql3qzOmjTN9E
	 j9OKdEWPU/vi+tQuriVRI5fW05TJrFDETBOEds21F8bfCXaKb5v1IEw1muDvAYcbA0
	 yKa4BmZeaBzMJ3efVjkL82+16EZShRsCN7eCKwx52L93tfNBrPCZY3kGF2e8UXpITf
	 dnr2WEE7C6nSNwqLeDiJ71j8mYMDrL5zS4YdkbkyZOnM0dyBIq564iQKdnRj0P1ZyV
	 FCe9i3PtafpEVOCIftNwUpyjHoX4dQXyCXD+soUSVAKlW65//KdUOhIIEGkTzf3+wS
	 tKN9dPZxs1lqQ==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64ca09f2170so8350712d50.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 04:11:50 -0800 (PST)
X-Gm-Message-State: AOJu0YyNCF4F+KeTI8VWq1PhK6Z+DSGJ9M4szqqGuBmOGMzHyu9RM1yI
	QGd3NXHOPVVdCdDaYGVEBZmB6XzF/oIX0nZ2iVs+8e11wCeOspCNbOAZFw+/RMppK/cEEgLaKkS
	nld1OjFBM7KYCYS/ehXzNhF0KGf2jH/w=
X-Received: by 2002:a05:690e:1384:b0:64c:2581:eedc with SMTP id
 956f58d0204a3-64cf9bb0248mr4548654d50.48.1772712710090; Thu, 05 Mar 2026
 04:11:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304084808.440955-1-xujialu@vimux.org> <44DCF3FEA681AA9F+20260304084808.440955-4-xujialu@vimux.org>
In-Reply-To: <44DCF3FEA681AA9F+20260304084808.440955-4-xujialu@vimux.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:11:38 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Gx=MgrYQdSyLMQs_6=P2pMOBjwNvUCzsA6wEZ6SgOYQ@mail.gmail.com>
X-Gm-Features: AaiRm51tSyYxI4aDP0UwvNO3kbw80K5f6MI1hMcQxx7lExNxDVuGrPz4WqQzF7A
Message-ID: <CAD++jL=Gx=MgrYQdSyLMQs_6=P2pMOBjwNvUCzsA6wEZ6SgOYQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: remove of_get_named_gpio() and <linux/of_gpio.h>
To: Jialu Xu <xujialu@vimux.org>
Cc: linux-gpio@vger.kernel.org, netdev@vger.kernel.org, brgl@kernel.org, 
	krzk@kernel.org, kees@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DE631211787
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32560-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vimux.org:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 9:49=E2=80=AFAM Jialu Xu <xujialu@vimux.org> wrote:

> All in-tree consumers have been converted to the descriptor-based API.
> Remove the deprecated of_get_named_gpio() helper and delete the
> <linux/of_gpio.h> header.
>
> Signed-off-by: Jialu Xu <xujialu@vimux.org>

Almost!

$ git grep 'linux\/of_gpio\.h'
MAINTAINERS:F:  include/linux/of_gpio.h
^^^

Fix this as well, with that change and if the rest of the changes go in:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

