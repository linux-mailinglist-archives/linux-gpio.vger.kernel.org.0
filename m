Return-Path: <linux-gpio+bounces-36097-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UyaQFCQS+WnV5AIAu9opvQ
	(envelope-from <linux-gpio+bounces-36097-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 23:39:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0F4C4295
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 23:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 037653007229
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 21:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6784361650;
	Mon,  4 May 2026 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sDKAD1/k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F363603D2
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 21:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777930780; cv=pass; b=CN1BmReaecryFou0mWSQQKzaODVau+8mZ2vrk1cD5ymHVP0G8nqys0jhY4uZ+DBQTyIux6COM0+faJ42whjbaUjpq7cgxwgLrGZCRSD0URVujS2iXYIuuZHXeOY5iilRSoq7M25lKC6CCwNrXnw5br3tqS26DsLsvTDfal8Tw6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777930780; c=relaxed/simple;
	bh=6YjbNRliUsnvFxeuK2qme89F4cjmT+3UuPzE2SBEtCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIUWTX/DZL9IIBrcb42ljRk+vYpnYc2CmHkPGiFRhq43lcYp6nRB4tTMfhMFTMm1s6vZ5u0W6xER8J3/Di619sPYF0pVQ6PrZonJTejgf3trFvn16xOU6hT5aguW5RpLuXjeN1ptiFDiZv1lhD5dGIpvsVYMrU0tqr3aAgNhMAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sDKAD1/k; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7bdaa68cf81so3213637b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 14:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777930778; cv=none;
        d=google.com; s=arc-20240605;
        b=Rx60AMd0dWPpF7GkHmZVAywr18XMZfMfErvfpDwyRhfJ0Fj/UKNSpNekWe2BHjTZFY
         ZXPwW37T/y2xjuf5stXxLLd3UOiyWVAX7Td0QNi/Tv9+a4HBe6SHDdwumxXAX/g0gZPc
         fUI3DLHM4S75i6kNjP3Rgjr4vT2AZH2s2K9Y+eUb1kYX4N3rwq9rIPm4HrN/K1gvgBTh
         3lkOIVv3z00nzsA/O3595zKqB/iyIUkBf2ZJrp9QMniMSBY7zguGEllLa+wybx+qXMZK
         iJlN8Xa5BgccfhAREDsRrQqxn60A+3hnTjIBLyiHvq4Wyi/buXn9rsh/nERntsrhbrsU
         zZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eYC1iNJVSzY2bMcbNG561uzmxYXnU3fLRm+besdn5aQ=;
        fh=WW7e65GYR2tMpEgkgEDF5MZEFWp6dV53dIQgGtXWrhM=;
        b=SGkCtrPAWr3STWbO9ZdqLckuRdtODdhY5pVIqz6+sshfQlfLHC1O0PVooiNTVeyYWY
         LaxDTw9/dMLr9otXpLReYgvBOy6qYNhRM/OVv7GOtwJ04uDNnO6d3gBaKG4lGapRKimv
         GzU+BeSlThccoQWYJ/SACZyslIZvPHA2uCX87Xh+RAilNdAU8kO3SPjK7qfIx0iuld0/
         CRoJIda5bG0+x7FOd44TWweFG+aKN0HA8O2wYzgAZLxjc1E/YRY3gqFqEfS8+2/45weg
         OcTysWhuGA9uHo1gTrxc4FHWCLw/jM2BBbauccfQ5WqykpPXgixPy3QfC4cCwRtIh/KZ
         z5Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777930778; x=1778535578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYC1iNJVSzY2bMcbNG561uzmxYXnU3fLRm+besdn5aQ=;
        b=sDKAD1/kr+kL4YJCdq5crsvI1b95BDVNgEZETcU81YuM9bx/crt77dgFlNZF93MxsG
         5uojNY2ozcAXNmEs+2omqfGKL2Elp7Jwq4l1fxjvFt9nU1TSKxcwBWa/R9FAzWiE2UPM
         p/UBuoiDJu6nh7Qu1EOEjXxquV3lqgENdJ/1ahv1RaeLTCvdqOMJrs3gmNV7nuyUlBu8
         qkmchWJsAs/1oGgzgM4IltY1zF7Ti51VvJ/Ef+KBQ78yFAeAx8GCnpy2MzmamKplbsLp
         PGNc67GKhfv2sYonjEeNGtIK57vDCNF2+e58TYAukWHqgaoKMFrPIl951i9S5BPh0jGY
         c/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777930778; x=1778535578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eYC1iNJVSzY2bMcbNG561uzmxYXnU3fLRm+besdn5aQ=;
        b=WvmfWeJL92ehflmR+z1DtcGuChp6iLlPHe/0U87+RUMGkLXge+s6Rn/1MaAUnNO27x
         kY2fzN8AvQYBZ0Fwtda7pftSStplYDKrDMYhLibZ2Iz+mOiPrvd7prlgxffawN3/zteY
         wg8ccPjdPwHNEPWDXYgXgpvQ6By2zJhZheKT4oAilLERLTADarOkG51xRtyKrCu8ohrV
         6wWnxgOg/FXPyfaWGQDFEc0YYJ9xSsNfBrRbLCHXO93PYy9DvLiWGMMXjml9hbgsDadi
         RZQ9cBr9W6STgQAacIm2AJ3uOhZtBJ4lycVtdLiBUwMlU2ZbUBpiszi0rmlFutjECsOD
         uZkw==
X-Forwarded-Encrypted: i=1; AFNElJ9UkjkwoJjqKxqHlP94rQcN1dZlUCxnyniT6Cwn3ml4hhW97vxWty1hVDZKOOcb8q9nNv7PBVs8wuYX@vger.kernel.org
X-Gm-Message-State: AOJu0YxkhQYIKCI1sMfxXs5qQ9J8Kl4++58YUa28ju+0Wmxj/pCnAi8n
	LeJHvm53p8gh2bExlgYydGnHvPSZO3Erbeg2DUhNZb+kAIaG+aQD41KVxDBKPN4+binPpN6pDh6
	5diVn/XIiIA9CX9feCD7md8CWsLBwCl4=
X-Gm-Gg: AeBDieue/Swgn1/VNgB87CpVriKpD3cQeRD3BBKv0BXpOs0fmUzM2zVyyx6Iun3sRf5
	OPeM8aJFHEuDSH3hojARx9tO9rGo88ov3AeGSSTDe0SehAOFnh5CLNZnjR9zEjWgZ5EaunAD1sZ
	sfJ3/NtEGZZt1z3UzhHBR6ZURMoEmVimHCRdTqqc5LqRR+puAamrVanhNQukOodYIZ8QlckVnQ7
	E6DsQpqfeikTN0wTkSfcSSUzL8zgpTImof/peWC6bkiJ+Xv35CXfS142smk7XM6zgJQ73u+5ruO
	FiDzelLEVLb+D9M=
X-Received: by 2002:a05:690c:7107:b0:79f:d961:47bf with SMTP id
 00721157ae682-7bd76f7e855mr115202087b3.8.1777930778428; Mon, 04 May 2026
 14:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504213429.64596-1-lucasp.linux@gmail.com>
In-Reply-To: <20260504213429.64596-1-lucasp.linux@gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 4 May 2026 16:39:26 -0500
X-Gm-Features: AVHnY4LaNExOPQrEc1NolhlO_WfrWDKhv5R4XNd0vYsoY3AQL321-a2kSMrC8lo
Message-ID: <CAKqfh0F2zdLCJ3dMcbDZXsq+_V0_2+FGWPUThfN+GevUe-YZEQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tools: include: add proper strscpy() declaration
To: Lucas Poupeau <lucasp.linux@gmail.com>
Cc: acme@kernel.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 49A0F4C4295
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36097-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]

On Mon, May 4, 2026 at 4:34=E2=80=AFPM Lucas Poupeau <lucasp.linux@gmail.co=
m> wrote:
>
> Currently, strscpy() is defined as a macro for strcpy() in the tools
> headers. This is unsafe and prevents using the real strscpy() logic
> that provides better buffer overflow protection.
>
> Remove the macro hack and add a proper extern declaration for
> strscpy(). This allows tools to use the safer string copying API
> once the implementation is provided.
>
> Suggested-by: Maxwell Doose <m32285159@gmail.com>
> Signed-off-by: Lucas Poupeau <lucasp.linux@gmail.com>
> ---
>  tools/include/linux/string.h |  5 ++++-
>  tools/lib/string.c           | 37 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+), 1 deletion(-)
>
[snip]

Didn't you already submit this? Doesn't look like anything changed if
this is a v2.

best regards,
max

