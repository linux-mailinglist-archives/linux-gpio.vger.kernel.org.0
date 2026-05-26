Return-Path: <linux-gpio+bounces-37546-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPwvDyveFWrTdQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37546-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 19:53:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE845DAFA4
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 19:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 343C9302864F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 17:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FFB41C319;
	Tue, 26 May 2026 17:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8eqL98R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201C338C42F
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 17:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817857; cv=pass; b=vEhwYYnuH4w434iGZFrR4sPoi9RZsNJFOr34zXFD/Q3XTbefLjT4vHxWIKXRBcmWWfbvWscJsmkDW8karRz4P4RkxafUHBrZh30nUHmgyTG6WxIoy/hT7+rhCiMVVA883rUgwemeTr7i1hriJzF+cWzp5af+cAOFX8ALIg4k5wU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817857; c=relaxed/simple;
	bh=kfNjzPONj99z0SVG0Q6anqC7yEoD/nhQOvijAYwNCMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rsMYeKh8BtQoQgF62jraH7kLYHIvkLuY/0JdzmoNS6dyfcD+98GY66DQqscJqc8Dil8Udcg2qQaIUZQNp+CfsWtpu6vn0EkUncXX9dWOxuTV2+Q9Bu3K1djfuTiRmrKkbaMsprh8i71gPvneZkZ9lCYQNwZ1deBMNQoiL4eRWrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8eqL98R; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7cfd0d8eb09so74028757b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 10:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779817855; cv=none;
        d=google.com; s=arc-20240605;
        b=kwHUKGtCO5r+jT+cWvsJkrpJNL1ZNkqtkuo6fTJy693aIuMpZE6+T8XHk808egPDnF
         TQY30pkYpzJXSKeT3HUzz9pxOh3IBJcaXJ14ksMjdJ+OP6GQ3k0mNBXhHX02YBqM4ZmS
         UZVCBE/WRJpMVGDAu+R0wao0xPpC6wIwjFHNG2JJxTAnICITQuohkgK+M0eT2g/ToRzK
         9cP5w/F5oD3Mj1yvOjfKKBUkkdrp+XZWUPuhlVUSHx2UavAzpwcMaL/uam4uzD4oynus
         4S4bHkRPbxbWUr9ldoht4j+Lp2Gq8gV1WZwCpOS9pFzYpVZUYlkZEpTftJHCsZt/9qMy
         RiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kfNjzPONj99z0SVG0Q6anqC7yEoD/nhQOvijAYwNCMg=;
        fh=lVbY9JkkIKGU0bgEFTL/gADrkzuiP+/5Ir7IXoxPEiY=;
        b=XzvF7qmGplaLeVBgl+pkAh78BcYnqvBUiVqR3asaFACVMb+Qne/vioe91jzw6rxVWL
         JEuU/FbKQ7KdoDD6kpyDp946T51ir9xCLqICwLIwIfzJbYxxtibXnSDQlSQyrW8sJcCK
         nEeAMA7Wn9R3zwI9wdsbxLzQEZX+CPCrmct2d3GBydTbC7dX3XSeNoG63VJWXxUWoQJK
         nRvK2SO7bUyzDm38MrU5mT+wtpPMish0GrNhe8m88Ghln4hykoesK6twtJ4y5ODUWVoO
         uWIjIxDWOK3NtkGtXWZfRd22AG0NWeyM3GLX28IgLewtMNER/Nuj4kAByoqRzgmdNn4R
         nAbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779817855; x=1780422655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfNjzPONj99z0SVG0Q6anqC7yEoD/nhQOvijAYwNCMg=;
        b=b8eqL98R4Ch9MDfH+hDrrrO3uyHqwNIXdONNspH9vensQK0N3kH/31uR4Oo77VecbC
         zq3jtBlG5TzhvPUqmou4QFkLidZkyhkSYdlWXjEYcbEwUapX+1jdJhC+PMaI2ijSVkpO
         HKqH/NB1DS1MtsdXGF5jp9ms6JZZSOamAz7UhZ0Z9yV1q4oZudQDX8U6PwSFmKUw24L1
         I1KyNYmDVKijSXfxxR8kPcL0nxMSPTK5wLD2g13wIkeYMmVzCfYycwcR2EWuoBMrLOdW
         pgyqqFMM2qKShKkaLR3LQyh8F26UjW2sTMjsFHxe3BxBoMIUzDYP1K7O+EURyq5pXWeP
         E7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817855; x=1780422655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kfNjzPONj99z0SVG0Q6anqC7yEoD/nhQOvijAYwNCMg=;
        b=Hlo9mre1j1rpLdaIAZOt/lvHdJmkagdhk16AL7cTzQnzaH9Uz03zMqCuWcMC+056u0
         THSNS37eXy/ON+xs8fkEf7Uh4nR27/9ieCyQSDGlDWP1O4GOnGe/Ubh2HLF2x5jO5JDI
         a29g/6y09fMsDIie5dDSKcIsbOxhvU7NNRhrL+NylcGctstFmJ6WkxCqWkPf6pkVceol
         DEqoPPqejFNIA1ZZrBTTtY18IOA7b8HRcKce0AUB35KYci0Kc+02t6YvtqCFs0Ai+x2r
         f9+7+9xXDI45nfG/kylYRrOkYrw10yKWPDtgAArD9F0G0pLC0xF0trmFKn2fr3560+Nz
         +j7g==
X-Gm-Message-State: AOJu0YzBq7CEr28nqDozdoDY5RFh+IXXxY7Mwo5/Ja7YRfk3THd2WoXh
	CRv7bqtc0uOiV3c5h6i41ly8ky/9f1QtBM1JqIhyW9aRHDD1AWOMvQNwySG3ZcG/siMBNtd1Fcv
	23ZHvLxbw/h6J5CcnUYbsn34A6jjrKhI=
X-Gm-Gg: Acq92OG3lk/EgP7yAu8Y61i/uZoK+HKC9cTCEWWwW7O4vgnfqrks0ixjYMzvQeQV7gz
	3iFAXOtaswEDmI4bymTkp4qd+9HuAsEPalImHahSeJq+WKZJ+l2CaeYfRoppeRTXkACRcPNQcmD
	8se3GRxHn/B4t/9SKpUtWjHrg7tMlefp1Cko949NMbd4lJ4PBO5/pX5jr6YDIn56ZMPMemHoKCR
	Hxd3QYKu58cNoChC2CT+Q2SNitKVu2TyQNy7NMDH9oBHZJ83f+WCYlhpnS4Mc0afSVtp8krW4s5
	0WEGbx81WQOMQEhrBcX9me5RIoyoCZsi4avPs0+3
X-Received: by 2002:a05:690c:88e:b0:7bd:5d03:dc1a with SMTP id
 00721157ae682-7d337db19d7mr210541817b3.1.1779817855044; Tue, 26 May 2026
 10:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522200419.105496-1-vfazio@gmail.com> <20260522200419.105496-3-vfazio@gmail.com>
 <CAMRc=Mfh=NkxE-i88gvfC2X1dMTX_2wXT4G4bvvzOvTxxq7=qA@mail.gmail.com>
In-Reply-To: <CAMRc=Mfh=NkxE-i88gvfC2X1dMTX_2wXT4G4bvvzOvTxxq7=qA@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Tue, 26 May 2026 12:50:44 -0500
X-Gm-Features: AVHnY4JU8eZKr6_oc0qziCaWje9mwBvvLmsOJHefPsayAq-x9Ytl33fusDKl8hE
Message-ID: <CAOrEah6eP=K=3Eq6st8CVjAoObgVffPjP-mbz7B-nXPK3VpsOQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/3] bindings: python: support free-threaded CPython
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37546-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: ADE845DAFA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 6:07=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> > +The Python bindings, much like the C API they wrap, are not thread-saf=
e and do
> > +require external synchronization by the caller to serialize access to =
objects
> > +shared across threads.
>
> Do we need to document which classes and methods need synchronization?

This seems fair. I already did some of that documentation in the threaded u=
nit
test so I can copy some of that into the docs API consumers actually read.

I'll fixup this patch unless you want other fixes folded into the series.

