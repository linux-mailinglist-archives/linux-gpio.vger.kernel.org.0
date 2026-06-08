Return-Path: <linux-gpio+bounces-38128-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Zu1KKxBJ2ohuAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38128-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:26:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6BC65AF51
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:26:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YkBPYO8+;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38128-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38128-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62F48302A060
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 22:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446333AFB09;
	Mon,  8 Jun 2026 22:20:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA515352C4E
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:20:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780957246; cv=pass; b=F4J0pII5rSYpb3lUf3xWgtIfVOb/Ecq19jWI698Jncd/N7M79LKxaUrlHCtpYR7HO21PN9PCU65Bw+cnOCZp4+WjWrUcXttqPdVUBXlni4MLK45suXGPsxC0K+BdNaA0UwyW+M1Uj6HEDUAGAyTwIDpgZqaEY27xpicEdkxlBP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780957246; c=relaxed/simple;
	bh=DOMimRVVPSoBu99x+5EusXE+gdciQcRvWTfiDCdt+N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BbKg/IjnLiMpI7+96K+/ms7MQ2Fu2K+uw0MZy/Qi8j1VE5fG6GlbbL6x3DfVeUDDGD4lxhvfpP3OI9osv94PhyWJPA2aEEElwRxYu3HAfI3XyCIcZctEG4GI5IE73TFbIv6XPmgrOSlyQgmprZa2iOjpwuscXVIBM8Yt4tT8BUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkBPYO8+; arc=pass smtp.client-ip=209.85.208.45
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so2421350a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 15:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780957243; cv=none;
        d=google.com; s=arc-20240605;
        b=iuLtTfh7yZxSHMGbqg4SfAifo5xCbcD3Ev7xUzI27rvUx8psUwo2+f45bBSPVponB2
         /OqEG47QG0Sx4i0+dWdO32s2yRfaCcpcqlzo46hcyqzLC/Smfvr+fCpchQD5uirXECJW
         dpwzm9qtq+6JEPS0VQyqTlrhlPg8xnfR8l4nvSWAF+LhGlEPa/CFB38QGMLY4WCM9/ps
         q2ByeEI3p7fir612rfo1JWV+Ko4dgDsZh60R36XDh7wVr/h6cQY7nGv9Len/MkQFAfkx
         VPIEa+QBp80aZcAViqHxk1C3sgY5lrLKWmKagKqwuaTTGVsUMZHbpJPGdTWnWGtv8HKX
         h0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PIx6RD1wfhBNe+wNaNSSZgpl+7acekIC9L2IujVBANg=;
        fh=cN3itkKxSV5ZcV2mWP5zp/Tu5+BL1XGHb17UfWwqS6c=;
        b=TrFXovgZuOryrFCcqT/0Esl4CD+QVBgNhtBBjmSX/Z0SiziCEquAT+n5YXh88y+I5S
         CJ4g9x7tMxDPadHjDQR2wvkwMBooH9vC4zvkco95K9RNYpRZfwyoAY0DmtrkY1Uog5Yv
         4f1Oex2NoCEim8TWVVxlROACv2ht1y4xaRDZ3uilFQkz+mrnjC+V9TEjcG3zOHlcPgDl
         0jx7hwkCdsFjsCo8jZkT4hBwq9YtP61V5xRjC/FUYKyDXqha6Pd+Oeo0hKcGmH3nSs79
         txAqf+oPysKFPV3TXBi+e44WFbpIaRiFo10ULpkuDkME4H/DP9kXU01zyq7jioMPrHlM
         /Now==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780957243; x=1781562043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIx6RD1wfhBNe+wNaNSSZgpl+7acekIC9L2IujVBANg=;
        b=YkBPYO8+yeTuqWZZxQhCuv8bgtFFQUNeC4BuraiL5o1igUzAop+s64iZN7kTpWsl7q
         8YsXcjOLl/YK2yvchzjBNktnntCQXShGBOaqzuszsDY8CLb9BqzwubD8dDDebgq463ga
         dlqvJhknYNc98feGZ50gp2q35Enb23wxQvQHs1bz8SfP8/yVCiIhWnMrRdJbWGnZd86Y
         v3MCGWEX/Q9A1zWGo+Ln4rrBVnz0cw0+dCRdRsmsEgpvvOZufJuYuhY5zadMtuU3YbsA
         Bqjdz2DXV+M41wVkLSNy7lnV8XOTi18gaJJp4C7VP3wSs8BZ9P1+BHKJyAFofZt+t9ZI
         arJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780957243; x=1781562043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PIx6RD1wfhBNe+wNaNSSZgpl+7acekIC9L2IujVBANg=;
        b=LET5CwOOke04kv2+NIZGX0kVze7dXQJw5Jx6AtfdtWJpYfP7j+lF293b7MXtDq9AIx
         XuzUTpLhP4q+atjEcIFsIKUbGcaX4CtKfL7YiRPTrisGZy4yIM+L6peEENXEWAvrbTPf
         jfoHS7UHcTBudpi7B8c5S0eS6bBZSYC0i5HF0zMf8O71F13yRD0je7ZophbAzBaSMuIj
         ATil9nxczEr/8nPRp01YHv/7AfNSXeCbJVKOTwdHc3S8eZrAnxgCi6Fw7fQGizwh7p/Y
         jjH56Pg2suJGxsWjotaV7+aTGZePGur0yjUhPIKzLG4aLmD18JWkb08gBYdzogBDI73L
         4LgA==
X-Gm-Message-State: AOJu0YyyWlqIY0hAlE5ZNjeo/J9cQR2xHILS8ltAJ4gJgRoHofjXQ8jg
	A+DJFD6/xD85+P1/vlbJgS/8jyaWQsFEAFJ36UR0KxhefmuawPpJU0eU1o1pkJ3p+5yCEJMSWgx
	5SkuRJO+wAyaEBS9R9jB342RtEjKobYs=
X-Gm-Gg: Acq92OEqNKpUg8Ia86V3ADQ3IadX9xnq5hrk3Wm3JK+HzeoxKaK/GkE1Ng/KD5+ryfh
	IQEEHblWqHRn2F/ucybuW62e6XawGpEbZc6xF+y455pDWGJu6rRaHQy4hjVA8r5r5hgXTxzNZK8
	TsurwdFtbJMwH3kO50W13xTp/bgj8mHW2l24+Ce7dizFo25B9qnbd9/qAo8maP0oyjUvfqKpzFQ
	mPTyvvqcPPsVzY7EsSsUtS7DJ9SvRjjMigUdHlisWJbZmxU5amQ6T7RKG13I3LE+VC61T/APzPo
	/M/S6TopqdUFJ/RuX1G7ucj3YpK5ugpCYvTvkigeT8byF9x2CWaQj3no/GL2xePm+62ZAIO/8Tv
	tPMrWM2lCOAk7Nq1JlrZww6gA9g75bmSCRNI0OWaH9jTXHwhRtiY08V/3ThoPsxVdEeBA
X-Received: by 2002:a05:6402:5384:b0:68c:bb66:b23e with SMTP id
 4fb4d7f45d1cf-68fa4c0f935mr7904026a12.8.1780957243084; Mon, 08 Jun 2026
 15:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602050131.856789-1-rosenp@gmail.com> <CAD++jLmk3jMFS0DD0GGTV9AWu-oHJAoxymcyOKQycVFqKCRnzA@mail.gmail.com>
In-Reply-To: <CAD++jLmk3jMFS0DD0GGTV9AWu-oHJAoxymcyOKQycVFqKCRnzA@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 8 Jun 2026 15:20:31 -0700
X-Gm-Features: AVVi8CeE2gQXVP0qwTC4BwyqXNcI_TL7F-lX59gwa3gCUDmlY9Xhxsni3AVN22c
Message-ID: <CAKxU2N_LhgDj-+-gd0_N9gQOzCddq7dypYhayFQ_09zggpor6Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] gpio: move ppc4xx driver to drivers/gpio and modernize
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, chleroy@kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, 
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:maddy@linux.ibm.com,m:chleroy@kernel.org,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:brgl@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38128-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE6BC65AF51

On Mon, Jun 8, 2026 at 3:10=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> Hi Rosen,
>
> On Tue, Jun 2, 2026 at 7:01=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> > This series moves the ppc4xx GPIO driver from arch/powerpc to
> > drivers/gpio, converts it to be a proper platform driver using
> > generic MMIO helpers, drops architecture-specific accessors, and
> > prepares it for module build and COMPILE_TEST.
> >
> > Patches 1-4 move the driver and convert it to standard platform
> > driver infrastructure. Patch 5 switches to generic MMIO helpers.
> > Patch 6 drops PPC-specific IO accessors and enables COMPILE_TEST.
> > Patch 7 adds the missing MODULE metadata so the driver can actually
> > be built as a module.
> >
> > Rosen Penev (7):
> >   gpio: move ppc4xx gpio driver from arch/powerpc to drivers/gpio
> >   gpio: ppc44x: Use module platform driver helper for GPIO
> >   gpio: ppc44x: Set GPIO chip firmware node
> >   gpio: ppc44x: Use platform resource helper for GPIO MMIO
> >   gpio: ppc44x: Convert GPIO to generic MMIO
> >   gpio: ppc44x: drop PPC-specific IO helpers and rename to ppc44x
> >   gpio: ppc44x: add MODULE info
>
> Overall a very nice patch series and happy to see that AI can
> assist with this kind of refactoring!
>
> I guess we should provide some slack so someone from the PPC
> camp can test it, and if they don't test it, then it is abandoned and
> we should then just apply it anyway.
Hmm? I have the hardware. It works fine.
>
> The series:
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Yours,
> Linus Walleij

