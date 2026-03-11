Return-Path: <linux-gpio+bounces-33198-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOHtD8bisWksGwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33198-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 22:46:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E5E26A8A0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 22:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62E063016D0D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 21:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D3929B200;
	Wed, 11 Mar 2026 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqiQp5xs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E28126F3B
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773265600; cv=none; b=DyMe/76XhX4A0FUXlnVPYvIPLcsH740pW9YJMPljoFDVj/L+XbftIM0+Dw+Didv2AzTrMLfd6lt7h985hx2AwrB9/KY20QTB6AhsWsG1GdelJVyXSNyRu9ZK586GS0K83bjMOoc48bDB1cN/TnpJSVmo6LtIjXhxz98GWqWoL1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773265600; c=relaxed/simple;
	bh=E4WB8CGEUiLarR3T9osq/Oaqjj54PygMKczEGvbpNs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PreZiPEzlJC4usS+o+1p929n1f3IejgaBhohe9l0IrzawlCy/I24/8m5CzqydJJoLdAiTCLV1f9eqsyA/C1FeFv/bXQzPYOTXv9iwFfDGLr6NmKLEuSeYEI/B1l//a5uRPSfbZ/b/OPnEhvB4a8h6u9vYEp7mdCxGXbfArdiFhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqiQp5xs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79DC3C2BCB4
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773265600;
	bh=E4WB8CGEUiLarR3T9osq/Oaqjj54PygMKczEGvbpNs0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WqiQp5xsWQBhyQXGiOlqSuNomn0ZVsfEUfEk8SIZVgxgT0IX+ncQksj264uXyCnQS
	 WrPcYmxXDzPct3JUTHVrMcteFzg0xsS2kKOxyZtOGQlQ0Gf2WzRRZsDr5oMTd2nFyD
	 yOBlgvVcoCoNaupdApRFFNrLOs72K2Ze9DT5IBN8zOnA0dWELH0b2eTE9lpBE1Ok0Z
	 F1Pn6eORCrPQJCDoUlMbeD5ms5UyticxfWcfRx+Vu2gZruiX5q2HI+aiVAjdBfUtIQ
	 J9hwteJCT89l6vdlGSP6FC7qjdR2oB+jzVIcAD/K0TTQI9FCxBl7m/IfF4a3EK8ptm
	 4OUf7Wc9xg7bg==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79885f4a8ffso3514007b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:46:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPPNAHV6YUXMxx+1ggU4An0i82ES869m6Kz/+gppTUm5X/DgNmkRDB8/DjazU307a86RJCTq+5eWEG@vger.kernel.org
X-Gm-Message-State: AOJu0YzsN2xbMrW3gIrW6CdIupiz/qfNBmINcPxEYQjw5xyt5A49n3YZ
	HrEx9zYSWH4TwR8w0ZOsi64xLu4zANGc5ZZq5s1ZCMWCG9F7fsGGd1Cp4U4CTSN0l+cRx5/f0hG
	Y9bGah4xzKDfIidLObpFfN6oLARmRn6M=
X-Received: by 2002:a05:690c:64c9:b0:797:4722:f8a7 with SMTP id
 00721157ae682-79917ffd343mr37941397b3.61.1773265599658; Wed, 11 Mar 2026
 14:46:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <ce2b6b8f5b5432ac551720bad5776ef2ce490b68.1773150895.git.dan.carpenter@linaro.org>
In-Reply-To: <ce2b6b8f5b5432ac551720bad5776ef2ce490b68.1773150895.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 22:46:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLk8P2MxVXPQH7xBcb4+EvchNiU=9gsU4dabwhLfNzXaMg@mail.gmail.com>
X-Gm-Features: AaiRm52h-eY9dTa0n1sMqKmJTwOkVtk8E54CVD2Z9mkZZ7WCE7689aWdILDRW6E
Message-ID: <CAD++jLk8P2MxVXPQH7xBcb4+EvchNiU=9gsU4dabwhLfNzXaMg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arm.com,vger.kernel.org,lists.infradead.org,intel.com,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-33198-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: A1E5E26A8A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> The PIN_CONFIG_LEVEL parameter represents the value of the pin, whether
> reading or writing to the pin.  In SCMI, the parameter is represented by
> two different values SCMI_PIN_OUTPUT_VALUE for writing to a pin and
> SCMI_PIN_INPUT_VALUE for reading.  The current code translates
> PIN_CONFIG_LEVEL as SCMI_PIN_OUTPUT_VALUE (writing).
>
> Add a function to translate it to either INPUT or OUTPUT depending on
> whether it is called from a _get or _set() operation.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

I think you nailed it :)
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

