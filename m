Return-Path: <linux-gpio+bounces-35504-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBq0FrJu62l2MwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35504-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 15:22:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8D945EF1D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 15:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D8C2301E234
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CDC3CAE84;
	Fri, 24 Apr 2026 13:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htfiYNkG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A26C3290A6
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777036959; cv=pass; b=DD3+jxFTEXm8OYK16axFzVAdvIsAdGhcM0RoZ8iEgkHs7dd/4icL2m/fxgD1HYuSGMgg0G97nMrd8NXJizB4CuH3Q89kAuSV8RTJsUq652Pn5gKAXoNFNkKQayua1/INvrgeaYP7dLuRbVUH8AO2MVSgjRgDE2EW5s3d0iYZlzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777036959; c=relaxed/simple;
	bh=i3VBkDDnT1fe4npHcuSMiiD5KLy9rWkufI1EQIFp5JE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/Gl07aLHUtjq9pPXfUdhBVLwwhyCg1+8EtfT8VjLItbFCc+OoG2W83Ws3z8P/Z23Bi/2BNOBldkJ9vSbPq4nywxL0k8QDff2whbjxRTCPMSOHZ9awL7ZyoVsINukVU3Z+njwnZr1Nqke2aSmcXTHsh/8B6Fb+RL0KYuGImlXoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htfiYNkG; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-652f220595fso8167942d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 06:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777036957; cv=none;
        d=google.com; s=arc-20240605;
        b=llOlXGtlEIn+RDSnI2czD82gJ+artxQMTXAL+YqmQ1bFDjea+np8z82dl6Nt3Lfat+
         2b5vgsEk1g5k6FtCuxdYgDYlGUxy56WQSA1WmXT6Vhb5pbr+h5cc8BoQ0jzpMbYBtw0K
         yBm7MQhjbsy6ybj/W20ihhiXbnuabADitflLcOwsN3BOGzHX8vvzWt5THtJ5jXf1QA3b
         AzkSaQKLtDAUoPVhDqx7dA8jmX4XIvnpS4hIwAyWNt8DJxxs/G8pYXlD6Tm8Kt8I+tMS
         k5HYwwA5CaDaJteds/oiEMFLou5Y3td+Pf/25MwgBSp6ZGOEachJR55Ip6+/mmiJy9cw
         1zuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i3VBkDDnT1fe4npHcuSMiiD5KLy9rWkufI1EQIFp5JE=;
        fh=UnZ34nHPISuD47rzRcqffTD6L5prVBWm6ZzbOwNv0b4=;
        b=Tyk7sP1K29eeVxQar39FHeiciaSiIZSi3fP7g1u0uQy6TmIDA+Oitfw0asFAYam1v2
         lfAXiT51dS8keXomxSgSGZkj5PQnhGjM/QebMX/kW+YUXniubnkTsLDrfAJ0Rr59Jv8Q
         e3oIv5R0AzZbP4ZXq/LlmKyMyZphZNW+/okSlE72T1vptXExSkmnk3hTUK/pP1KMNfyU
         ukj78TBE6h9gS7UwmEGTy0joUirRiKSBAu23E6QbEVgIFZ7Xs30vj+Z9WgLz2lS2c3y+
         2VSqy1QfufeuqSb9OVjYwYN/xaZ9+5FcD74zvbNEaQrh+dYNWqX6L8UBdvXSoJs6ae3U
         Nq3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777036957; x=1777641757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3VBkDDnT1fe4npHcuSMiiD5KLy9rWkufI1EQIFp5JE=;
        b=htfiYNkG9fw5I0aruoe+hsMN3ul9w36rUjAslZ1szbl052beEaL+7chxjBP7oVdLLa
         AXiNoKRNzjMGAvDClk+iJ4ZK584KOQJOK3eSmYMm5ux0wLtdDh/bz22ZHIWo9RKw0tn2
         U+Z8kIVaAJNu8CQA3J1MOx792mU0f6XjaCisCN1VVJ8WRDXrZQ1s0S3zE7dA3TDCq5yW
         ZWf+9JPsmggBzR0ye1XZYIqUKQ9ADFyQFDXFsTzpncv4UUX7Misb/vOV8vq37GfeBU5z
         Ek08konTdjR9v3mol09ztzuhnUs8Isw+B32t+Xj/KEwt10hl2jiTDa97BDKx+eE+ob0y
         5p0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777036957; x=1777641757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i3VBkDDnT1fe4npHcuSMiiD5KLy9rWkufI1EQIFp5JE=;
        b=JLttK3NtzYJSjZ4aVMwkDAvljPsHGOnPRY0y8Zhq/814u+/lFbMlpf9mw18X7SINCN
         CBvT6HwcDqUzxHcam+DzdxA03IuiWgleTRd2cZtQvVVaS3oC2a5PQwJL6lBW3LZwS8i/
         aoYZ5NdOqtKyyeHRLR+rg1VkomSVsGc8bvexEA4NET08qURmpzYzYLh9gXun7hdgist3
         2dMEoy5tJK/V//pAGFUwWr/5yf4iYwrAaCKE8t0G2+29lA60/b78AF9sUKaTPRMBfbBn
         KU9akm8OSUaQWKYcPBrshA+KDKofRE4ZMRNdx80YBhcypNfXN6hOpPPOPY3aP82bmKIC
         44JA==
X-Forwarded-Encrypted: i=1; AFNElJ/vaOALyg/RrYiyiXAbQ+pazxmfUw81Ybi/gPv9vXjF+rA+gCu4ll0bXXcelQEgWjuq+ZXcUWn7+eyO@vger.kernel.org
X-Gm-Message-State: AOJu0YxDK3ZACVza8Srbi3wJDtUyMQWAEnuLLmDwJGIuoZV7b5VPOVqi
	QPoBPJhshxSJVWBO/s7kJYTBh2AkKXU/Sv5Jo4XKxwbjSJY/3jzaiHjqg/L16V2cXQHb/e2ZgtG
	9AbI7MYYjxFNbTMaf1RbaxVC64nJtZUg=
X-Gm-Gg: AeBDievVKKN2II3B9JRqLQWC7Fujm/voSfMZNsY9dwVbCE0gNmsT3+jhR5OuL7asmut
	z6xKYwxxMiDxINjbv3hhUn6zvXINw9zDxyIF6vMd5xe6i5IM8xoOj7PcuYjLbKl5h+v9fghTY2p
	EZoB5oOtxFZintOQACtaN2K6QABV/dZ9Y2tfCzryRHdSa+d9Wyi68i8iYi4VRC2rIA73sNOw+TI
	u22smM3IUKJtiWd5B645Ax9bp7EmmV71mtQG3rkIiNpi2GZdQGjVPzu+PpasoFpGWHCnfyMEMQG
	oqHem+eWLoSL1tJ7nrO6b6S4RZS5JIg=
X-Received: by 2002:a05:690e:130d:b0:650:2ff9:d651 with SMTP id
 956f58d0204a3-653107b8828mr28757367d50.5.1777036957520; Fri, 24 Apr 2026
 06:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423223230.47001-1-m32285159@gmail.com> <CAMRc=MdQHKbs-Q9TWqoSa=NLk8c=m-afCMZ2EqGByPg0TE51HA@mail.gmail.com>
 <CAKqfh0EzE5HTSJfJgYWKG2KC_-samjKVpDuBZ6cPsULWBnouew@mail.gmail.com> <CAMRc=MfJSVivb9QoVVMfvyPmkCAeZFc_Z6UJUk_RSX36g1Ks6A@mail.gmail.com>
In-Reply-To: <CAMRc=MfJSVivb9QoVVMfvyPmkCAeZFc_Z6UJUk_RSX36g1Ks6A@mail.gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Fri, 24 Apr 2026 08:22:26 -0500
X-Gm-Features: AQROBzDKnNOycij-uX6mokr1Bzn454_lviA08YK4t5z00e9tOpF5UCx41FuYytI
Message-ID: <CAKqfh0HyT-z-Ts_+0jYDojCe8m23Lu3dWoC7Skt9jHuvtNFsPg@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: Remove intermediate pointer variable and
 harden function
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linusw@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BA8D945EF1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35504-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 8:13=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Fri, Apr 24, 2026 at 3:05=E2=80=AFPM Maxwell Doose <m32285159@gmail.co=
m> wrote:
> > I think some people might value the more explicit dereferencing, and wi=
th this
> > we also won't need to handle the overhead of assigning another pointer,=
 but if
> > you want this removed thats fine by me.
> >
>
> I prefer to keep it as is.
>
> >
> > I can do that, but I'd prefer to separate the functional changes with
> > this one, so
> > expect another patch that fixes these. I'll remove those sysfs_emit cha=
nges for
> > now so that the commit history will be clean for when I come back with =
this
> > second patch.
> >
>
> Sure, let's drop the first part and do the conversion of the configfs
> show callbacks
>
> Bart

Sounds good. I'll get that patch out this afternoon, otherwise I'll be
away for most
of the weekend and I'll get it out Sunday evening.

best regards,
maxwell

