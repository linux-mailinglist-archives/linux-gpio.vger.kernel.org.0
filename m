Return-Path: <linux-gpio+bounces-32569-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GPiK8B5qWl77wAAu9opvQ
	(envelope-from <linux-gpio+bounces-32569-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 13:40:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EBF211D58
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 13:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D043A3084892
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 12:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1784139FCC1;
	Thu,  5 Mar 2026 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XE/oG3/f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3388639F17B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714242; cv=none; b=dQegcm79BVsd3Ku7mpe5i7t8AMS1ri51zUZV3v7Hr/Jcyn3Oq43QpwhV2Y4Z+z2mLYeovpdkdlJkpWQstM2W3gjdiAcTPXiUrzV9Ij1YD+cmm2Ad96rJcHyMFSIO+v8JDYsOyg4PLOouwcrGqZHpZWvw5oPAg4G26XTTu8wNuDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714242; c=relaxed/simple;
	bh=zK+446LDzPKbS1TYOd0boRw6wGRDmBJB8kXPGNrJ480=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUHJtHmYQZnF03hlrG6LheszWgwquljq4XQ5fUSZuTDsEW2mswX5HFlCDL2vPaezCa0TmuL6AmvQJ1o3q6v4BahDxp/v/u8D4GrhAqc1FngAb2ksmes+EeFWkJe9+tM8thpnVZb1vyDv56Bnq2d/JvtC7yLFXfRpk3AzSqxiNYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XE/oG3/f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC00C116C6
	for <linux-gpio@vger.kernel.org>; Thu,  5 Mar 2026 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772714241;
	bh=zK+446LDzPKbS1TYOd0boRw6wGRDmBJB8kXPGNrJ480=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XE/oG3/fMyPC3dW46N0Z6COw7jDlwhWm+GJanQi+adrIFfFNyHc39CfQrqnCefxtm
	 sYZn6hMSv0Ff2etR0wj4r3tHBGh/kH9vrVCixgku+Ze4dHMsTDjotaVDcPFc9EhlHH
	 ghzVdd2xT4n0eZaL0tlRgu2h4AMFRM/C4BxIniM/D7HNhLl+SVo6VahiZ/96Mk24AA
	 7Poe7m+rb5C6qRrsyhhPS+dxmeGuK9UYBpAfV4Sf729Xefg+LroM6hTAQ0G63HsUgl
	 9u3530Lj8ayd1Wa4hF8WCkgdDR+n5+Bu4iPmGONaAXZBMX1pa9zNknbxVqWDVtg1cS
	 EipGiNitPiCPg==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ca423ad53so7041351d50.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2026 04:37:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpXyUd+rwr0jvpwRRQ0cOZCJltmxLeKeaIsKJhpADw3cCdKLxwX+pPaAh0ESGYNj9U8PJoRKTV4ZVc@vger.kernel.org
X-Gm-Message-State: AOJu0YyrNwBgGEOZbZ8eyTtngVdG0zPRmlgjW/KlH7FalpRCvxFpQLFD
	Fcor9ejk7xGcqaRLt0MKW1pL93wvXCDTCWnKEjMsKenGowP2sU4V7/TKelAw4JHBIujIS+AM7mT
	JZIyAdLXmLJP0GKrpIG8ozAARvVJLJeY=
X-Received: by 2002:a05:690e:d5a:b0:64c:a444:cdf8 with SMTP id
 956f58d0204a3-64cf9c03d27mr3817433d50.80.1772714241059; Thu, 05 Mar 2026
 04:37:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1777BBA64A3D0F97+20260304105215.536399-1-xujialu@vimux.org>
 <20260304110740.548318-1-xujialu@vimux.org> <207C7323BD49963E+20260304110740.548318-2-xujialu@vimux.org>
In-Reply-To: <207C7323BD49963E+20260304110740.548318-2-xujialu@vimux.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:37:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLkBoxh__rGRPL9FxL=RwS+u0zc43g+fZ88A_3JTwWjE-g@mail.gmail.com>
X-Gm-Features: AaiRm51iErocZl0LI2WlTbYoLtXaDMz1NvGtoi9VStjEGGI_xqTJhO7UOAKsNgo
Message-ID: <CAD++jLkBoxh__rGRPL9FxL=RwS+u0zc43g+fZ88A_3JTwWjE-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] nfc: nfcmrvl: convert to gpio descriptors
To: Jialu Xu <xujialu@vimux.org>
Cc: brgl@kernel.org, kees@kernel.org, krzk@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 68EBF211D58
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32569-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vimux.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 12:08=E2=80=AFPM Jialu Xu <xujialu@vimux.org> wrote:

> Use <linux/gpio/consumer.h> instead of <linux/of_gpio.h>.

Add some more explanation, mention that the rename is
already in gpiolib-of.c and add your Signed-off-by.

With those changes:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

