Return-Path: <linux-gpio+bounces-38121-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5mPyE5AZJ2r6rgIAu9opvQ
	(envelope-from <linux-gpio+bounces-38121-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 21:35:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A61F65A185
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 21:35:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cWg5xFSQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38121-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38121-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C0D43037D51
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 19:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176B83E638D;
	Mon,  8 Jun 2026 19:32:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25193E1D1B
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 19:32:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780947131; cv=none; b=KB3DtmGLSefSQXINXtMOHIpYsZL90dw5307fQAygjG8LZPd6SEL5RairkM7Vi6nGuvsrnzqxkc8xrfiRpjNRRG2EPNcD3o9UhGgV4zukgWxJmXQS8IhDJjdCM9hTiZOR9yhHgA0ZjhJtrPWnhFhN5iJ2rpaNKd93irsUSYooJ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780947131; c=relaxed/simple;
	bh=i+xef67z8H3U5um0OvlGU+O9IEvJshn0REbzOSQp/bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxDiWh/MvW+eCWcFU5lNWNjjbG+UFy3vbFOACE29bC/5Z5bjH5CFNQgsgckg7rTRqGHZwuubqX2chCFuwVFrX7djcaMbTh1GsE6wF29LapkDWIeuYX4y8wYLfNM3Kx7HY/RtmlJzmscDixX5wrek7W2CXmKQS7l/STiYv6LXZVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWg5xFSQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653FA1F00899
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 19:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780947129;
	bh=iSU1vNN+OG/v1uAo8GBfwPKP0oF8rbqzLQCEuD7TGAo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cWg5xFSQwmFvzSA/BDssoqne7oJH6AUHNxnBNDrQn2XaqUm5qwY+bpCH7HbsxigxL
	 kbcvgQ0Kqtk3FnAX5EHdGcw7mK7lwfM4F+zyXX77fpz8x6leoonqQm/BQ4I/hG+6wA
	 WpWm8f03h/25aVB5VT8whBRht+cHaS4g+P7sGw6iCl77KRElfHe1w4HHYUFfK04XyA
	 twOXqLM3SNrVjiKyJ1IDRZQxCRfEBjLAvwM7X3C9aVONGDVocTRWViu/hmjqviYnXW
	 +uM/w+/fukNMlxmBfD3FpKFwlcL1XG9zyMERp1KvwUR8jU405AWTv1LX6CWLht5AQ9
	 Lh4tOpwrh5Oaw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa69131836so4096154e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 12:32:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ZjapBQbNcSPEv981be0nlmxQ72D1gh4UtvE2KmTZVybyeKmqU5iCxPwEP1TcoLYrpWjC15CcYcSK6@vger.kernel.org
X-Gm-Message-State: AOJu0YzwKSGo5bOpQ1fUigWfY9gJrdWdyI1mgv7doMNzr2RvTNiE9X7X
	XF8jLEPSV7k5VpKZ/usiK2vxXbfuOdXlgcAwEQQ7cmQQ0cJSfbvsteVJt6kZEEzLyakqeg99mXi
	7MQMHcLXIsbJ01HafeANsgoY0/eVHO2E=
X-Received: by 2002:a05:6512:40d0:10b0:5aa:62d3:3853 with SMTP id
 2adb3069b0e04-5aa87ba2362mr3027251e87.12.1780947128196; Mon, 08 Jun 2026
 12:32:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
In-Reply-To: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 21:31:56 +0200
X-Gmail-Original-Message-ID: <CAD++jL=QeKGjTp-rJJx9ddMz7FXe_N+S6g=PQyFa9F+NmtZa8Q@mail.gmail.com>
X-Gm-Features: AVVi8CemeUcizg5mbuDWSHGLC0iIcQYHT_kF3VUUVdtK16UGSxCSkSXUmDW8Uc4
Message-ID: <CAD++jL=QeKGjTp-rJJx9ddMz7FXe_N+S6g=PQyFa9F+NmtZa8Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: qcom: Correct MSM_PULL_MASK and fix
 resolving TLMM register address.
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Yuanjie Yang <quic_yuanjiey@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38121-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A61F65A185

Hi Sneh,

thanks for your patches!

On Fri, May 29, 2026 at 2:56=E2=80=AFPM Sneh Mankad
<sneh.mankad@oss.qualcomm.com> wrote:

> Modify MSM_PULL_MASK to accurately represent the hardware configuration.
> Also fix the register address resolution when 'reg-names' property is
> not present in device node.
>
> Also avoid assigning thread_op_remain in unthreaded test since it is
> only used by threaded IRQ handler.
>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
> Sneh Mankad (3):
>       pinctrl: qcom: Modify MSM_PULL_MASK to accurately represent PULL bi=
ts
>       pinctrl: qcom: Fix resolving register base address from device node

Patches 1 & 2 applied since they are ACKed and look good.

>       pinctrl: qcom: Avoid assigning thread_op_remain in unthreaded test

There are comments on this one so revise and resend this one only.

Yours,
Linus Walleij

