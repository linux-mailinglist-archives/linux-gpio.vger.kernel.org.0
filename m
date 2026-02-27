Return-Path: <linux-gpio+bounces-32268-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oConGIdfoWmksQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32268-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:10:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AF11B4F23
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18BAE303C86F
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 09:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56863C196A;
	Fri, 27 Feb 2026 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTLQOjgF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954343AE703
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772183424; cv=none; b=l82duU4cu8XQyL/6nt9XF4IQ/DG2EpmrnruwdY5x0OlsIrGjlIdHCPUn2uxFD9P46fNSbSLy1J4kkVIxNrZfo/Fh7Y99htJdOREk5UG94lY1I3htu6+4VY9Fvb8AukJP1pFR/sXOimsIQAKxWvGXxdHkmgn2KSWbrzNiFg0oIAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772183424; c=relaxed/simple;
	bh=bjBai5VMBRxINe2gSxt0OFxPY+LNhi/qFeai/omC4rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ps3AYg/hZFxB19ptAneSwE6W+sU8RVeKqtljR6pqsj4aV+d5hVoezLjUC+mtWfZPGYVk6ICgwv75KXZgsQMVbGCelWIh7MdwiKBe/C18stu3zsapDxuKkGsmbZ5OLxvXJayjEAQWT4c4reKXnQv1+zNh0v+ZV6pZpo0ZzFI4Vng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTLQOjgF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CADFC19425
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772183424;
	bh=bjBai5VMBRxINe2gSxt0OFxPY+LNhi/qFeai/omC4rU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aTLQOjgF+Izt58NrMO8+3KvJInX5pEKucIn/DhuFgt2iPOTbslM3BzxiMcO9nrbA7
	 g2XuAt5Dfbz3Bamcrz7OvvmY1EhVYxp+OI84VaVYz6JMzzDy+H+TpaqA3XgqHr/GJK
	 OEr5XJT6VpMFSpPJSvrtbmK+rgnhcZsfWtGNx7apLJbomalaroHg8F6ZeeqGmbJi05
	 Q747vTmBajhZcAMuj22G9WR+l0i3q3IW5f9RoxQfusCFTRRY/hmPT3TEdTqDu2irrr
	 GXdDU9u9HBlGj6ttwpuO4N0OzW9kh5jAw/buC8wf3H02JtsSTWRVzaAaebY5zkhsOj
	 ptkf6iktJPAjg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-389ee8efedeso18443651fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 01:10:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUquHYMnxFK/jYtu/5lpIru2Ei2EPG2WygOJfH3aCq7ZkKm+efOUXRLoFESSTW0QW6yAembZ+UrKJYs@vger.kernel.org
X-Gm-Message-State: AOJu0YyLbyoRGK0TtO1GqI/mm3UmgZm403n1/2tnmhjXVFB2TcaNV7CB
	KQP9eCAR4q8H7MkRYMDqPttU8ne3oe33ayKA//rsMRPmqypSUp5Y/3iBavT9buMXV3mhkTkRm/W
	fJHj6ooznjQsE/uZkbBLIWuAb6J+k5BlM+3bous02Eg==
X-Received: by 2002:a2e:9b19:0:b0:385:9b50:91a8 with SMTP id
 38308e7fff4ca-389ff13b8a2mr8360891fa.15.1772183422910; Fri, 27 Feb 2026
 01:10:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223061726.82161-1-tzungbi@kernel.org> <CAMRc=MdU_1WW82imNHPFVktn0HVSdY7kkGScEXmi+JaKRNTMuQ@mail.gmail.com>
 <aaBAN7OOFNIpb6Wl@tzungbi-laptop>
In-Reply-To: <aaBAN7OOFNIpb6Wl@tzungbi-laptop>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 27 Feb 2026 10:10:08 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfDR4G9pLgfMOP6MeAS5aOZbuueQXZ3q8-cd0a769MCeQ@mail.gmail.com>
X-Gm-Features: AaiRm527EpsJXo-EefYHuwf7JrfrkmJAWlDHFNjnFafq_knYOjBbLmBLM9lPAOk
Message-ID: <CAMRc=MfDR4G9pLgfMOP6MeAS5aOZbuueQXZ3q8-cd0a769MCeQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] gpio: Refactor and add selftest
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32268-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 22AF11B4F23
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 1:44=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Wed, Feb 25, 2026 at 02:26:19AM -0800, Bartosz Golaszewski wrote:
> > On Mon, 23 Feb 2026 07:17:20 +0100, Tzung-Bi Shih <tzungbi@kernel.org> =
said:
> > > The series is separated from v3 to lessen the burden on the subsequen=
t
> > > revocable work per suggestion in
> > > https://lore.kernel.org/all/CAMRc=3DMfQumD1ULx7yU4W2sx=3D35wyQf7-v4tS=
f44OqEu3JDBUAg@mail.gmail.com/.
> > >
> > > The series is based on v7.0-rc1 and applies after
> > > https://lore.kernel.org/all/20260205092840.2574840-1-tzungbi@kernel.o=
rg.
> [...]
> >
> > This no longer applies on top of current linux-next. Could you please r=
abase
> > and resend?
>
> Did you try to apply the series after applying "[PATCH v3] gpio: Fix reso=
urce
> leaks on errors in gpiochip_add_data_with_key()" (link above)?
>
> Tried on next-20260225; the 1+6 patches apply.

Sorry for the noise, I should have reread the cover letter.

Bart

