Return-Path: <linux-gpio+bounces-39037-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9YBbJX14PmrXGgkAu9opvQ
	(envelope-from <linux-gpio+bounces-39037-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 15:02:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F01AA6CD45F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 15:02:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aBwLeq6b;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39037-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39037-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21203300C987
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2026 13:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF103F786E;
	Fri, 26 Jun 2026 13:00:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CDE3F6C2C
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 13:00:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478856; cv=none; b=nglJdRnf4rwDvOmA1eEKVfeZYfeDJS0X+ZUYYUfIZJQ3y7IcTUqdDeCTBVBIdmmbuIpjmRpHJaayVXZLaEaCXcOiC8Tmv3Gx2N4JSbStAPj/vvoGedr5LLD2Fg+67FCf1AWQdOO9jHuoevfRrpiUnRq5j2mgDsMSFc/BkD0jy/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478856; c=relaxed/simple;
	bh=iTDFRcoOX2mW1vso78AwymUzJJutA5D5oB2YNEAJVE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XkInPnrBCpo1UeWrT9earaWKuHAXxji71zg78b9yAXSzhD5dlpzH6GkKZv2JDykgTjsqD14wLswnZuU2/H7aM9m3pH8XsvRBhG8qrTVM6wWKuasqU3DjthZyLweHW0Kr8rowTaB47ug2jgrqn7NQIec1YNAg/c4l3wcUh9cyaW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBwLeq6b; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611981F00ADB
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782478851;
	bh=iTDFRcoOX2mW1vso78AwymUzJJutA5D5oB2YNEAJVE4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aBwLeq6bWhZr32T8aD2lGWU9gcgEwszLyr5SGPlsBHDOQ5MmJO+zQa7uf5Af2/d4V
	 0jNCf6YkCoXxYqGjpGTsTsLgCYjhPEBqCVGaNx4RtvFp8LqDA6xgYULBsdJ6eTBcVa
	 7e/F6BeRH6wSQYtKdKFdAyJKTvACcnNmM97K10Ln7i5WgZfwGCRsWf8U6Sb6hoKnMK
	 TaqiJW2xxAp7cc4ckG4+j69Mu2qoAQb2sj90lpQgY556l/hK1fgZeu3NPu7x6EvtrB
	 +egG1i50XqNESnWPuA8lrhdUdg4lM9lMOlAImn+8Lr12sX7Ds1uIQwH54+nzf5yeM2
	 3gn8MEWvVAG0g==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa624ff3cbso851364e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 06:00:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrMNl7vN3s6PTh967qXAKrAQSYyzX4S1aoxeTA6DOc4N9d6zFVphsOc3Bv8YV1AxBe5Et6FGfC0LMTq@vger.kernel.org
X-Gm-Message-State: AOJu0YzAxD52Bamm+IuaQ/CscF23XnQsrnVSk6s25iyCDZSBVsB7Hdck
	ozp28PqBk+0pu4pfTEp0LOX6EhhW4H8FiaJDMKq4s5ROz3widuMIn1iYZc6TOllr6t3Zo3XSUOh
	rI4L/4NOS69qjJfd0E2TLjmpvfXg9WBU=
X-Received: by 2002:a05:6512:4042:b0:5ad:53fd:7890 with SMTP id
 2adb3069b0e04-5aea1f573demr2135828e87.46.1782478850170; Fri, 26 Jun 2026
 06:00:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com> <20260610-pmg1110-gpio-v1-2-a9c50cd8b5d9@oss.qualcomm.com>
In-Reply-To: <20260610-pmg1110-gpio-v1-2-a9c50cd8b5d9@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Jun 2026 15:00:36 +0200
X-Gmail-Original-Message-ID: <CAD++jL=_27BOr28Pi_UqjDpJSuRztYGKO2CXynOvwSVpe1-uBA@mail.gmail.com>
X-Gm-Features: AVVi8CdDn3FcSL711kJurKmZc5nVMJQ_rHGuP824BQqR5PJ5KEzjTLMZMeS180s
Message-ID: <CAD++jL=_27BOr28Pi_UqjDpJSuRztYGKO2CXynOvwSVpe1-uBA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39037-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F01AA6CD45F

On Wed, Jun 10, 2026 at 9:05=E2=80=AFAM Fenglin Wu <fenglin.wu@oss.qualcomm=
.com> wrote:


> Add PMG1110 GPIO support with its compatible string and match data.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Bartosz will queue the patch, I think.

Yours,
Linus Walleij

