Return-Path: <linux-gpio+bounces-32805-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EHYMGiRrmk7GQIAu9opvQ
	(envelope-from <linux-gpio+bounces-32805-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:22:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8270E236192
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Mar 2026 10:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC3D83063D75
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2026 09:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DF9378818;
	Mon,  9 Mar 2026 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVF/Ebxo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+KYAKGH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE37378823
	for <linux-gpio@vger.kernel.org>; Mon,  9 Mar 2026 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047964; cv=none; b=UtufXC5UKVJlnUZM9vZMqQDzLM6doAG8Swm1ryOkdgvrSxp+csjrQ6WOOCZCfldCSefmHziFpnlmQSCcQskK0v0LvTPFeKicXX8G9/FL25+Qq60xdt94djpJgkIqIGBNmhHP3sWafgqtQP0jnUBQBCP600RX1mciJ3CQ/8wRZWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047964; c=relaxed/simple;
	bh=sWYxcos8CMroC8A0lEd/tGK72D2EmXzR79qIMS/1B8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JljWgv+DhGEIYQ5a2yMF+umON6SVBVBh7jS4kCuu92M3l1PHqVzLiwfNFFx7HjvJnYJAbNLHiBe6NYhgxo9p00za0uuS/BjHzeSpR3JNhTx17ZlpE+PmEsmrB4qWKab+UF1l8FAHrixHJJqeZxOIDM2Ds6l0PA773jWgczR2RPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVF/Ebxo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+KYAKGH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62974L4g2910422
	for <linux-gpio@vger.kernel.org>; Mon, 9 Mar 2026 09:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5FHXZeFzUeyWtXo9cOsbCZfVzR7z7yw/JrW7ploJ2qc=; b=ZVF/Ebxo5j0WzHW8
	Om6ekYQlRbCDxrceniKGYKNM+7/P53FtG4qFWmMZwkrMW9vHNNsyj6g/ov9Sg4Ni
	452e6zFzQdaox6/lTUn+sKakw7vhIYZBfpGD2Yfy17ogtheyTyKtZjdSzf4bKoCS
	OHPr4Cwf2FL8wYYmIDPX/d6GhPdJ/tcNC7mo+BY6noOPt2R4v5WjjgKs5QMZQTUA
	c17iCzE/CIKTFDWFV4TqExpQ+LNHnalFNPmv/P4u29WusXN8j6r9k3/Alq5kycPq
	cp4RaTvXrviDPM/kNCIRqLUxL89IHSvn1+uqyhH503+O/pJ6C0V/ufOIvFWrvgtD
	FFcEMA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8cnj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 09:19:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd773dd39bso1301096885a.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773047962; x=1773652762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FHXZeFzUeyWtXo9cOsbCZfVzR7z7yw/JrW7ploJ2qc=;
        b=E+KYAKGHaOauMibN6qQKvKiNDhotLj5ONZ81J38ktCpYv0KGal2jqdz9guXh8vpU/+
         vfhOEqVPzmDXYFbA0AVp1dIy2oGmD4paQR/0SZmgOmAVKpDcbSBDMb4v8hUPYqvPFhMH
         ErYhlNVfT5cUffTznudgNfSrRZ4qbQ05dKn5IFNy8ZJ7byp85Kyo3w3wfDYp31UW1GKV
         otzesbsPtMgT8MJaM014VWGG5DwbRyMn6KBLGOhiG0BnrR7g5kCJNnhB6qSEYe6WNcSE
         GVJ/PT7KI7FLTWuT5v2UVW9ma3oh2oslH5sVkrz12DDMlKqhaaCiaN9VQiuqOmxJ5W2n
         DT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047962; x=1773652762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5FHXZeFzUeyWtXo9cOsbCZfVzR7z7yw/JrW7ploJ2qc=;
        b=XIc7C9FzX6eXR5QDA28t44RoXfcD4O62xA9HlbdWVxLv9KUNYGpekY3ybZlCy5Blok
         APH5IrKAZ9BJmuYc56IM3w0+qL+Xsz+c/iA4ZSZybFyx5f56nzNNDuOa1WtxXPfwdUo1
         l9Axt7takKspI69Qw33unJrUv7VfV9WOwL0TefVWw8f9P7rYtzwNvroa4tH0w0TdsAd1
         P74bhW1RLCJEp7DIMd9p5ubZyOIKlju54mjLio6mOMflhSddVEdzSBE0n+IYn+pCePZk
         265t6VDEs5RRdZ3PBnZN1ygzhgBWFhiPuiOu2QSj2+/tiUlWeLHNgd/iTdNItxx1ugQD
         ro/w==
X-Forwarded-Encrypted: i=1; AJvYcCWzdqgSTMVmnWwQlffiCySIznZ54R3PIRkAP5Z4V7Fhn5HLE38PeZOWkcou4ttUpq0H4kBYbfQv1QUc@vger.kernel.org
X-Gm-Message-State: AOJu0YxQrUCum6kNNqgwpiZWF7xHTai1vIY9sF+zo8wfVchcK7bFqDaf
	fxgG3Ca6uPYaVBRQpZQUKq0YH1YRO2YfOT0a0R2ya5L0QBEHSIKi5/2Zb0kbh0aeXnDYzXw/H+F
	WoswuN1W78bmg5y5BUjPo8JSoDwqceEWzm0IPZUYmIfiE4UPISqNolH5ZYeRQikn7
X-Gm-Gg: ATEYQzwJmYsmxKhC0vvBGygehpaM6NPlVBgS9a259oqCqQZ5BtC7sp7W0gpdiuQCTbu
	QZbZQ7umVIgcKBFLxUGtUOwl9nc6w0dnH858S2LX9cUnFmGyRrQ3kDJmhnNWWB82Ru/ude6tHg5
	Q2l+w6mUoa9OTIvhQQAjVw4TQZZZ/8JKS9cG2PuM9BCUEVAMLhqSmBkQlfAJmGWAz2vzd0+2jwp
	jbYnWNAXIrVLU7QRIRrRKyNrpNPLRLcE1RdG1Bz3Q5BKSdl5+HadG8vy3T0tkEFKPFMSnfaaEr8
	LJUlcfS+qC4/JrHBHcaeOKBP25fWZQbXotl/6eIVCaZa+NQ1PEbB+YuAX53fqXuzBUy6ppLSn12
	3YqapszVeIhxIDTld8P8lXM1b0OxRh07em+mkjcZUIEdNaZmX
X-Received: by 2002:a05:620a:480c:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cd6d52bb78mr1199076585a.59.1773047962203;
        Mon, 09 Mar 2026 02:19:22 -0700 (PDT)
X-Received: by 2002:a05:620a:480c:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cd6d52bb78mr1199074785a.59.1773047961774;
        Mon, 09 Mar 2026 02:19:21 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ba90:b1dc:5545:17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853252cae1sm150954195e9.3.2026.03.09.02.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:19:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        David Jander <david@protonic.nl>
Subject: Re: [PATCH] gpio: Document line value semantics
Date: Mon,  9 Mar 2026 10:19:13 +0100
Message-ID: <177304793359.9428.6068485267622762602.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306-gpio-doc-levels-v1-1-19928739e400@kernel.org>
References: <20260306-gpio-doc-levels-v1-1-19928739e400@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: p8mHGwXw6EB-W21DuavWJvlevDOL-Vuw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4NiBTYWx0ZWRfXzHw7Rijn1LS+
 18i7aiP9fCFyqG2xLfNCy36p/tLe0T6zn9fsPEY2qeKXwOYW0Lsb53JLqChjyeRTk9QxUiQJCdh
 6ytyQCgbbgrrNdiDEA6bwSyO1RdXT+m8E0DpplKX6oq5+4n3c27lV1MAVPXvXbXw6OAV4unBgkm
 HcS74zRWr3JtJGKUfRDQ7FSqG1sY9n3KLQeE8UF8xAHQUM2FIRDIRNLysK6cKgHNl9St+BG5IiT
 DABf4cYvC3pl9NL3yAS6uxlpBBvRKdvUldPD9SGyDUIC66JryP3PjesLbM52KaWAax4eCSk22Qh
 YZB+aZrfqThQB5V8/HIYf0JBPqFjPwcfA2bNf4Km1IB/PWAz3fb6SP7N0nrTD3KAEnXysghY1hZ
 /0aQFvMbkGSNgzPb6/rFBm/GvdM2E4GLOLc5M59szrqHawx7aSBgyqnPtoMuJYDyOdLkyg8PtQT
 qtoT+cUO3rOD9oBixpw==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ae909a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rrvb0uiYveUXytfXFyYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: p8mHGwXw6EB-W21DuavWJvlevDOL-Vuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090086
X-Rspamd-Queue-Id: 8270E236192
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32805-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.957];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Fri, 06 Mar 2026 14:22:00 +0100, Linus Walleij wrote:
> It is not clearly documented that the GPIO driver API expect the
> driver to get/set the physical level of the GPIO line and the
> consumer API will get/set the logic level. Document this in
> relevant places.
> 
> 

Applied, thanks!

[1/1] gpio: Document line value semantics
      https://git.kernel.org/brgl/c/5645f805927c9bd4443e6143e487ef3ffea34aaf

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

