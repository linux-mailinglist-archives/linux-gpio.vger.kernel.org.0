Return-Path: <linux-gpio+bounces-38314-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qE1fAAJyKmrSpQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38314-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:29:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B566FDF0
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:29:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PN4jQlXG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a+haFEJA;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38314-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38314-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 419C630210FB
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 08:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99B8347FEE;
	Thu, 11 Jun 2026 08:26:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546630E82D
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 08:26:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166416; cv=none; b=DgEwDOAqQ4C91GeqtmhZo7A9macw2UenlGGXkUephusCpHzKZ9Gi3xGnwy/PPoEut9JAl7DzE35/PmhqeqXwVRiBp+Tnlg/JE1Yhcckm0XBnXk2J9RNP0k1866HLz2yLDYJ8fdNAuSgjOdntHgA97L5nVQ085wOn6Kw9cMXu+j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166416; c=relaxed/simple;
	bh=VZaZYTXXTHuKORtRjiS+4S5vW1DJWXlc0Wbe+/8lUXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A67ND0V0Fh17rAdUfV/knAlw3vxxL2/N0vteDIuhataX8WKNIoXmJm/MLcIGKa+dlz3/HfT2OFAiINtvEDHTVdql6B8ypjHbV0IQl64Gu3IIrIXFkrduZ4xOmVsV97IIVUNO25POT4Va3CwsoJsN0io7vjt8sfve85fqdfwkyPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PN4jQlXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+haFEJA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GUiv3846382
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 08:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cmuiYBuI/cQ1awNJmlkAy5LBkEf2fOwnrE2dBbNrSVQ=; b=PN4jQlXGEDJcBrL3
	bTfm634ErT3XglhvhgVrP+yd6q9H8Ne4GxUAJap/r9cG1ij0O/FaKspDgrAOBSff
	6kjMS4FkXkgKBNeIh06Y6WRFsq4nJ8T231VQMshXqesVHAnVx2SWxqJq4H0qqEcG
	ChqrJOq+gchzV1Fr/1YFJFUc4jeWSA7vRyKwlFv4tZtwx9x6N52pTyhyzteO9KKE
	8vBv+iPu7uZ5QF+adE1WZ2IwsZate3n5lhomvEfrRJ/PMpso/1KC+W5diWeG+/CI
	KxwCzRcGw4W02/xDKuZ6P/UEtkztRB4CPOM9Tr1EaeDVgJQGtQgxRw+fBQc6g7v9
	cXcu/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u2ehg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 08:26:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9157f453a27so1451315485a.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 01:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781166414; x=1781771214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmuiYBuI/cQ1awNJmlkAy5LBkEf2fOwnrE2dBbNrSVQ=;
        b=a+haFEJAxJyvI2A1LVlA3TWi39e6vpG0slhEpW/Kcg1/QKrbSxreE6evnXeneLbnN5
         cvZWqsvyvno6qlum4tM1JrIbH8wS/4vQBt5g45bXMqGKD2q9P6vdE8IVcfm0sl+Nk1tC
         RlMNHJ85lA/6IifqEDZP0ixsoE/cBE/fF5rFvCWz81ELZHIc0+ACMmRO5PiNnrz94mzk
         jdaDP0CkCu2kFWlNwC9XV4e6UgP+R4RPJH3COWCv7MGx3lZeUEd0xbSffTC2tQ6RFGqx
         4HbKTrUghFKBFrKhUPOcgecFbklx0aSYi9AbAW7Isvay3Rleq1sPXSoHbunWjugj0vkB
         lR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781166414; x=1781771214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmuiYBuI/cQ1awNJmlkAy5LBkEf2fOwnrE2dBbNrSVQ=;
        b=ovq0QEAaX51qJz0ZMfK0dO7vIXejHns03Oc9pXHNZm9PkxvvfIut60SQLTxZF/Ke2J
         6XB0ZvCMDfep+tiLCP1itTmvphDihlU33it1n8CNilmTncvkzPjgjHjRqOItwwIUKv6c
         6cVV2r+AZBsKQhGUx31sQz7ZcYSLijKwCRKGLJ2ecIT46yqVKQB86T5YO62BYIieN+/Z
         bwEjRsABNzX6kmMVLwqi8UHHyOBRvwsuDRrXUGFMVIhsEg2GjECvfhFdFRlfJfMxeSzu
         HjzyqH2qihh0bE4hbeTOteiApRwpZMnJqKrwl4wdrfXbwtbMAsflKpkTz51yVH18r0z2
         cW8g==
X-Gm-Message-State: AOJu0Yx+1U+1nJSDkfxaq7+CMBs/GX52dI1DwF4f+60PBp/OagUPdxV5
	IdyNtFHpKwsdbzDHgPLFnsuAg5SNxsrhoSHdIGF2fVITYOdy8l5F5ETnxZFR8M8Fc61MsOjO38i
	mDZP+ElYRkynCYBB5GfkS9j5WhBZhTHkqBkXiX/EX1F3xXTa50eIvpX6r2PUiFQDAR2WGH1k+2w
	A=
X-Gm-Gg: Acq92OEV6MoNyXv0qDgLVpPeWX7ncKoCyuTseRlC1KXGIZAm+9GkS+vsZk2el3Nh8RW
	xO6g++NADsjPCvrOqpWO7AZ7GzQuti1/9TQDaGVeArrRJ8qd02fDtn+hWQYU1KmYeC7bJxCmjT8
	KFB//UPkLF/mHlF6HpK4Th4GTtYzGj76Ybpm05BKXTurcUnbwqxsgSm0KZL8HXP/L3xcf5GEyyC
	OSQIeXz7cit2ACO1Br73X51Dbjh3pwJFXhVRgGiQXJM5iJRZkn1fgyJDL5sLYuM8iwxsYH+bPWb
	utX5AFQcfv8CLBmZ45tIsr2eaqKg3Kk2p44v6hNlbUw/jpy8oDQFpl45j3G3O+XUmVOeEZmRFvA
	LmXNc9Hv6GYzq7wgVVkTu2yp5FTmPpnUfpjwETt4H0BgjxX71QbwSQydwgHXo
X-Received: by 2002:ac8:5fc9:0:b0:516:d955:ea2 with SMTP id d75a77b69052e-517ed8c2a69mr29524521cf.0.1781166413936;
        Thu, 11 Jun 2026 01:26:53 -0700 (PDT)
X-Received: by 2002:ac8:5fc9:0:b0:516:d955:ea2 with SMTP id d75a77b69052e-517ed8c2a69mr29524201cf.0.1781166413448;
        Thu, 11 Jun 2026 01:26:53 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:27a4:5f8b:adef:25f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46059346676sm17236048f8f.26.2026.06.11.01.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:26:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH] gpio: nomadik: remove dead DB8540 code from <gpio/gpio-nomadik.h>
Date: Thu, 11 Jun 2026 10:26:51 +0200
Message-ID: <178116640765.24618.9371690696196698988.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610205007.44881-1-enelsonmoore@gmail.com>
References: <20260610205007.44881-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a2a714e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=a_Ti7rOo3WaRpfP1ygEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 4996NgaB-OQTL-9auof36cjctZH7-8JB
X-Proofpoint-GUID: 4996NgaB-OQTL-9auof36cjctZH7-8JB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4MiBTYWx0ZWRfX/P7N0HBd82F/
 iWike2r2BnBYZjYy3v77/kBQbeUsJgc/nphnvY9DkX+ajJAUeMWh5KRj8i4pKU4eTlFIRF9JuF6
 wmX/udUG32MR91k7EavwfMTjOTcw/49tP2d/hidgXNWLVYRFenTfru1KEqJaqm2VpkBtZTHWgZD
 4GOIEPgaQaQJOFm2e1g19cYlC6EhNenCZODKLTd8JkOYQtWmZfxfyzgvKYol2eHzhMKoxLI1ddR
 Lb0ozw4lnuISieAM7y1dTL27ciAUO9hpKqMEHE0IHuq9RN/i7T0PNAF0+EWT2Ih/hycgkW31YAf
 wXCvFf1MN7rbsv2xNZJrTTBjxKQKiYaHmIqfquznU+J+l5rD3bDPD30AGM4V6Xi66jVFMESrxXG
 xteZNxbt9odlS0EdgHSxMxpbb6zpOeCuYgMjO6ieuyhZEhAEQHNVOeS0FdhbjsBexzVijdM1uFu
 Cy8sX1bmWpzRcJuHB+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4MiBTYWx0ZWRfX+06PUsaTqdCf
 WIvyd95PzthD6ikyBbNPeI5j/NS/RIHRYPj5dmATzPCWuT2UbufNsJ87ocIzyteAiL3Ql8QXOdK
 /JEV50g/dQkrgJpsCBAFS/OaAzzsHKQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38314-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:enelsonmoore@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B1B566FDF0


On Wed, 10 Jun 2026 13:50:07 -0700, Ethan Nelson-Moore wrote:
> DB8540 support was removed in commit b6d09f780761 ("pinctrl: nomadik:
> Drop U8540/9540 support"), but a couple small pieces of related code
> remained in <gpio/gpio-nomadik.h>. Remove them.
> 
> Discovered while searching for CONFIG_* symbols referenced in code but
> not defined in any Kconfig file.
> 
> [...]

Applied, thanks!

[1/1] gpio: nomadik: remove dead DB8540 code from <gpio/gpio-nomadik.h>
      https://git.kernel.org/brgl/c/f953585dafd71ecb0897f9def9c0a3702afc1bf8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

