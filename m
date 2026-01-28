Return-Path: <linux-gpio+bounces-31248-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBnuLp0jemmv2wEAu9opvQ
	(envelope-from <linux-gpio+bounces-31248-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 15:56:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27495A35A7
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 15:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8690303AA95
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F32736167D;
	Wed, 28 Jan 2026 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2VBK3Vu5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9E729827E
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612017; cv=none; b=FL7PyV+dHE8/1qpr0qiVMMTwJmCK7LUIyv8B2W+A+4sAk5m2FdOTyLwcYPGifDoXTiWuf6mKwPNrXKeGiGaDO1cWGBH9jAQl2JhJ+zM0FmvqpFljWZWLw1JQO5TeiTtspIzZxlh8T8qQxA+OGM+4wu275VD+kZHZzt0ETAB8EQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612017; c=relaxed/simple;
	bh=RLGH0KLlJYKtiHI1o5Hc7krURGr/94NxReup/3F61b0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=DbRmQXLmx51iG63gZM+ZaLKcW4eCI8IgV68IXdZHJ9V5fCI0obVP4IaeBhKV9sVockWxrVHpGD5w+27gzgSsI0YMjLnYxMtL1Bv/tyap4kA12KokfmsWoJMgV8+27qITh6CLJ0mj/Q7+ccAnIWaQrdU6h4TCER5kqAK0A/3ZbBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2VBK3Vu5; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65812261842so1588798a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769612014; x=1770216814; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tvMFVjPj7LszBlDjv0UEAIY+fzVqoG9LSfE8sRUrMQ=;
        b=2VBK3Vu5lBA6MLYy4oFSUJkVAPutIIKdV62A7v/I1JF/Qc6Bkn5OPE1dRB58pgVjOl
         FN6hU2dQNRI1w5UQpACYrs794d/ZOXmPCJOvE+Xcdk7R2mJ1JGNAojZk4XU4uCMHkrNc
         Juj8qNug6RyhvLWpzgWi9zF92cDtiSV/mFjjjcTRb6MT/TOfDXRg00wiAeadXjwqIJrL
         uu+pFGdKTsrwsSv+GVsmHZJ1bUye8elzi/HzQyj4qrh19VGWxRcj6aarrd5mgbyZLsWd
         X4A9lR4rjaDHKE+BaPubpQVIyqs8D0CxPFIhNPG8SBstzotuW+mgLpdpGryTrG7bZSTj
         L/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769612014; x=1770216814;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0tvMFVjPj7LszBlDjv0UEAIY+fzVqoG9LSfE8sRUrMQ=;
        b=HpMDbIUbf+W7N6fzeRdEzZwqVIH+/uY+CUpRIAibL6erYcFGNQlWEmETBSQ8DG8N+M
         UzcrJsbBHiUt7uyUeMMXYme9/Ph/ujGecKfE0eGVpabJEc04SHWwHhLz9k4L3ntp47g+
         KRCWhcmymm900IDDVCdK6Xe41sFPBxuXp7wgF+NwKSGczU6p5ECe4BfIsbTvneNtyCND
         38jcvvznsVL6PxkHMEB9jANP+OCmi9wBQgx9VDGaTpxUe0idmdLVSpVeJ7r3CayTnKF2
         Izpa/S0XVHHytdWb/eS0GrL6H9cH3Vgwi/minZDA6dIkp6QCZny4bGQNfV+Ajlu/6EsC
         9Sog==
X-Forwarded-Encrypted: i=1; AJvYcCXZSUPdCfs1e2Q7M4YAH1X1znCY0ek5WlqyXCcqePPkJuAgEtbF3GHwE09laGtIXpBOFdFlVYak3DYr@vger.kernel.org
X-Gm-Message-State: AOJu0YyMdhfFxliPq5Et7262ceFKuo3pUEw/cF/MI5C6MEkVpEdJWhh0
	7paukmdS4zZqlnS8i1CzaazjKCtSgbn9/Zxar8SLRv7HO8IuuCdYNI6dmqweLZxURQs=
X-Gm-Gg: AZuq6aJj3Py+A2vGWTS5dNqGASxF2MjB+aeEPaZgiCHEx8MpBh4rnqLOm8Ebn7LeTc9
	7QRdKt/OjhlDmHRZChmhKtC8WKqzznWsS/BbQV73vr+8fglueAqQ4/or4Fq7bTeVC/oQxoA7xVJ
	9/RbuHe3EXfwZJcOGwGmhz1R8Afvr0Hzex9aQln9S+DGL0OL0gTFpwgfOtRgxk6x/nIcwPmxOax
	3BZB2XZfPL+/xUeuhxLNPX4wWdAFOqe676CcSuErQ6392pkUdfHsrPEwgNP2/HnVUjuRS60a/ww
	rUpaivfUF7to4FWZjudGstQ3xvNJ6RH3kFS9sKNHFuScA7YaaiZ4tnNRIhRkSYi8PzQZhU3qw/s
	LWkr8eVl3wHyWCUr2VbrfTF16CVOxUPlif8t6yiMVinH7eKTx88M1KTS30G4zwj4NBmETB8HoOv
	gNecynpEIuiDiO0zPsQiq7vyXx9LmHsPAcssZ8kJRRlO2JKrb1WfRwPEjYG6GHYIeMHN0=
X-Received: by 2002:a17:907:7b8d:b0:b80:456d:bd99 with SMTP id a640c23a62f3a-b8dacc41fabmr404660466b.19.1769612013870;
        Wed, 28 Jan 2026 06:53:33 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ecc68sm137096266b.64.2026.01.28.06.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 06:53:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 15:53:33 +0100
Message-Id: <DG0B3RX07B9R.1BLBFSOBR0MVL@fairphone.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, <linux-gpio@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-1-36583f2a2a2a@fairphone.com>
 <176960748074.1497503.9897313421386306393.robh@kernel.org>
In-Reply-To: <176960748074.1497503.9897313421386306393.robh@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31248-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 27495A35A7
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 2:38 PM CET, Rob Herring (Arm) wrote:
>
> On Wed, 28 Jan 2026 13:26:49 +0100, Luca Weiss wrote:
>> Add bindings for pin controller in Low Power Audio SubSystem (LPASS).
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 ++++++++++++++=
+++++++
>>  1 file changed, 124 insertions(+)
>>=20
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/p=
inctrl/qcom,sm6350-lpass-lpi-pinctrl.example.dtb: pinctrl@33c0000 (qcom,sm6=
350-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('i2s1-activ=
e-pins' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-lpass=
-lpi-pinctrl.yaml

I fixed the dtsi addition but forgot about the schema.

Will include this diff in v2:

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lp=
i-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpas=
s-lpi-pinctrl.yaml
index 2fa2484e7bc7..4903b2d37d89 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinct=
rl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinct=
rl.yaml
@@ -96,8 +96,8 @@ examples:
         clock-names =3D "core",
                       "audio";
=20
-        i2s1_active: i2s1-active-pins {
-            clk {
+        i2s1_active: i2s1-active-state {
+            clk-pins {
                 pins =3D "gpio6";
                 function =3D "i2s1_clk";
                 drive-strength =3D <8>;
@@ -105,7 +105,7 @@ examples:
                 output-high;
             };
=20
-            ws {
+            ws-pins {
                 pins =3D "gpio7";
                 function =3D "i2s1_ws";
                 drive-strength =3D <8>;
@@ -113,7 +113,7 @@ examples:
                 output-high;
             };
=20
-            data {
+            data-pins {
                 pins =3D "gpio8", "gpio9";
                 function =3D "i2s1_data";
                 drive-strength =3D <8>;

Regards
Luca

