Return-Path: <linux-gpio+bounces-37508-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO1pBENrFWrxUwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37508-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:43:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 656995D38E2
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 11:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A74A303CC14
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 09:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66323D812A;
	Tue, 26 May 2026 09:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQ9oDQ4d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10B63D3CF0
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788278; cv=none; b=ZOpH3fl17o0x5c6RUlxyxLQZyKyDr5UiqJs4utfrqt2ULFB3A+B1BdSW7V0tflZ5YU0qDzqHnJX9gM2s4zrg93AhbfBq3bkOdEySMfBRXOeS+xhx5/ksPr6vesnJSW0xDHMfrnr9UFv3KzoZp7MsZHALRhaRg0HMnlYaFylJBCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788278; c=relaxed/simple;
	bh=RamxczrDkTfpD/uq7uYKWHKuBX5S+hBe1gCTRWwI5js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PT5Pi4sCr8fwGDtz0jrgmqeC1kAvcEhxDUWo6xmPPNasMtsy4KLI9LLtlP4qpF0zAJuwXt5o3nFj0ccgy7yxBEAeDbw/VW2zqoidMJNq47dza/tlq67vntuonnO1owT9ypVgeVKG6VOeRFyovQM9fwrYIHRer4WSEoz2XvkRQOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQ9oDQ4d; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA1A1F00A3E
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 09:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788277;
	bh=RamxczrDkTfpD/uq7uYKWHKuBX5S+hBe1gCTRWwI5js=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eQ9oDQ4dubvkNfGsvvci4vVc0rleSyeD5hMcWs8u3J8PldwbXaw3fEIWWmplauveL
	 E9wcoWo7QwPKaIld4wc0S1HZSvmTiRe3UzXfbYgNv70T8lENjNXQXbbwMszhWHGf2u
	 dRjNhKuh0GIwrLZngKWCrZpTdpsyYsV0zfy7tvw9j5E/ffpEvRxO2Gle/LSaKR3XA0
	 nY/YCKjk0GHObYho07NaOaqwF43RHxA2EgPe//LFDwhs8FiV8CFQhpeAJ6XO9LGovQ
	 etUsUMVhI1aH6tZd0IU5Kxv0YzlycHLTFszk0W0m26SVQXOmXpqdWdWy9BxZ5XODij
	 OXWwYTGmiG84w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so11084331e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 02:37:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+mzJ4/o7WgowMfxYs62WuNFg6swCvXvY2itiuUG9I5SpL6TnTlJGiK/mnS8gg7MfTePd5IRCr3nQjW@vger.kernel.org
X-Gm-Message-State: AOJu0YwRG2jf7EU4I5UwBaklojoZzvegvrxHXbf3l2IExeHbym0g8WBP
	agwFQU+/U4gminuTEkuKntD534DOYR9qL5ZxoQnxfTte0zSIRbgwOqJ6rmRn/15AapSja6EgwM2
	/w6O3jTzZvup9DO7pZ5o5gULGM4Hhr1w=
X-Received: by 2002:a05:6512:b95:b0:5a8:7652:9258 with SMTP id
 2adb3069b0e04-5aa322b59f3mr6612098e87.0.1779788276105; Tue, 26 May 2026
 02:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260522204644.4101640-1-ajay.nandam@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 11:37:43 +0200
X-Gmail-Original-Message-ID: <CAD++jL=gPF9jzPe90sy0W6ogEWq6LqTnbRfnoH5qxwGnBTiGMg@mail.gmail.com>
X-Gm-Features: AVHnY4IxJ5u9-qkC7NezgCC2A44S9q8hfxzS5BbhGCvt0846BJsNJ5yyEO98Kow
Message-ID: <CAD++jL=gPF9jzPe90sy0W6ogEWq6LqTnbRfnoH5qxwGnBTiGMg@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 0/2] pinctrl: qcom: lpass-lpi: Switch to PM
 clock framework
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mohammad.rafi.shaik@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37508-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 656995D38E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 10:47=E2=80=AFPM Ajay Kumar Nandam
<ajay.nandam@oss.qualcomm.com> wrote:

> This series converts LPASS LPI pinctrl runtime clock handling to the PM
> clock framework and ensures GPIO register accesses runtime-resume the
> block before MMIO.

I hope I can get some feedback from the Qualcomm maintainers
or I will feel tempted to just apply this...

Actually the volume of Qualcomm patches has gone up the recent
months so I'm starting to feel like I need a Qualcomm submaintainer
who does the nice things that Geert does for Renesas and Krzysztof
does for Samsung Exynos and collect the Qcom/MSM patches and
send pull request to me. Think about it! (I know very well Bjorn and
Krzysztof have enough to do alread, so maybe someone else?)

Yours,
Linus Walleij

