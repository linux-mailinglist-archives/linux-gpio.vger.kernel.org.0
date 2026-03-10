Return-Path: <linux-gpio+bounces-32919-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHa9MAUEsGkWegIAu9opvQ
	(envelope-from <linux-gpio+bounces-32919-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:44:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA3F24B718
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 12:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D176531F1BC5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 11:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D75389454;
	Tue, 10 Mar 2026 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMa9eaGT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647453876A7
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142763; cv=none; b=k3gsvIYSSVGUYu4AKJ04Q5HcE/38IixOaTKC9LNNj4q8CQ3VNR4u7yccbamnNirG7Kl5bOCK2n1qkUuqg7lCQJsdECQniMPHD2gJaVR6eeaJW98m+izRYlLO3/4PvTX2kUYHAxYRN8lMGU2B7fDhCIx6rwjrziXmV3oBITn4hpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142763; c=relaxed/simple;
	bh=DRNBwsU1mx/Kbp+9Cuu0UYWjGkVZd+niIXr4tR9zHcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ItUWEbRX8nxl9KDMiH1wd2Ekh5Nd1SBMpZ61nQlXb8iQME8YgvnWLiDlhYMPFxPFqVHer68seR4v4mPTuT7umaFPKU85WrtZ37vgnC2hJrZ/Lo1+FdYgWLtw/21ceBA4DxZKih/ITFyBGuFqYbwVp1ysHxzlYFmmDhZkKSN6Ii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMa9eaGT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46937C2BCAF
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142763;
	bh=DRNBwsU1mx/Kbp+9Cuu0UYWjGkVZd+niIXr4tR9zHcE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BMa9eaGTJBsfrWj4oryzCPHzYoZcefyuPUyTsvTW0NvmrUsqjdI1LiAI4Vfmbfg01
	 /P17cJkehHayalib/hrqJImPTM+e+zl20a9A2YBKXvGlK5++9TM55UIc/Fn5hw6U6/
	 5o7Fk9RtIfg4o9u8C/WecKnSUJGjxK1QyeUDqJiB0KvPVbbDj5aZGPd6pKfs78HCjr
	 AHgsNiuxvstAaK5CP6V6XbcgN9GvPg+irk/SzDmz+rd+6t5HIWChYvE4nlrCrsrHFC
	 6qUwPzTnNTFwB5pFZ8pqSOaIR3MOB5XrKlbKolmP7UQClg6HIXumw0TC6L1aIQhq1d
	 SuT16vKqH+gew==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ae2ce2fe1so11838210d50.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 04:39:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2Op1ZNGvWWbsPTiXGsLEZzwBFwKwV09S5lMAv9BYE341o5QhzD4S87ah3c8uUl9iwSttyczPQF44g@vger.kernel.org
X-Gm-Message-State: AOJu0YxA1X/cwbxi/J+OIdBqaKHe0LKQAYWcLkqkP4kLWsWoBi7hFD0N
	eFFdeqoiQ/wqsCQOQrnkVsnTZeR/xyRz03WSxk927Iq5KRgJypvh0/keBm+9GVDbO0UeH3u5EKC
	TsWbGOfkMR7UpDmLd54QjD6FfomiubQg=
X-Received: by 2002:a05:690e:1a52:b0:64a:dfe6:c387 with SMTP id
 956f58d0204a3-64d14304e0dmr9912213d50.66.1773142762680; Tue, 10 Mar 2026
 04:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D5F95320CE72E20A+20260306035539.2443355-2-xujialu@vimux.org>
 <7131965EF4C8E8BD+20260307030255.3490715-1-xujialu@vimux.org>
 <177313382930.5248.1395703981822013627.b4-ty@oss.qualcomm.com> <CAD++jLmixL6hPx6F7ZMTay-9vwJEgqrNE2nfBskK-Qosg7eTDA@mail.gmail.com>
In-Reply-To: <CAD++jLmixL6hPx6F7ZMTay-9vwJEgqrNE2nfBskK-Qosg7eTDA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 12:39:11 +0100
X-Gmail-Original-Message-ID: <CAD++jLnvXovoby__FzdP-efQYs5o_5NEBsfHyG62dwNeA1ZnXg@mail.gmail.com>
X-Gm-Features: AaiRm51UIYqa_7rPm5Rn9t3vntTBLwBJlmfs7ub2XYrqe_Ols4FR1WrvJyzsLcI
Message-ID: <CAD++jLnvXovoby__FzdP-efQYs5o_5NEBsfHyG62dwNeA1ZnXg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Remove <linux/of_gpio.h>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Jialu Xu <xujialu@vimux.org>, brgl@kernel.org, kees@kernel.org, krzk@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1AA3F24B718
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32919-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:38=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:

> Did you put that on an immutable branch based on v7.0-rc1 so that
> Jakub can pull it in?

Ah there is a separate mail about that, thanks.
Sorry for my ignorance.

Yours,
Linus Walleij

