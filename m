Return-Path: <linux-gpio+bounces-39499-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S60sDCx3S2qXRwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39499-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 11:36:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB3B70EAB3
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 11:36:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dK0gmcyL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XTa8UGcF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39499-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39499-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0354A3028F65
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 09:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0D541F7CE;
	Mon,  6 Jul 2026 09:03:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657933A7F7C
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 09:03:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328627; cv=none; b=VV2w+uUBX4apW5+EZxEd1g3Seik+xSS+FJ0lCqDxeM+tFARZta9HCKw6A9w0cd0jy/TrqqWlRjb8tud+Vqu94zoPe0Vl+uvOZA05G8/FzRaPGB2ZDck+TtaWaQoULnYXUCQ7Suejv51jcEp/7M8hcFFghC3NFo6+UxhO+k2flcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328627; c=relaxed/simple;
	bh=rD0KXmjz+MWD845Fmw0rGhWvQfBevCHqTaS1xlxTxM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Si4SJpvxHrS2rZRbASMX7tkPxd1QqPFV1nJWWaD1RQ72EK2V/PAhQaWQdvWlTtJ2MPO0mjbHW7WU6yKTiOa5pTFOJs06u45DIesU/2JYx4g57Q0nILGe+yWqmIBXqoQPOlqh4218hRbjzRPWWn4hXqro0JTL3uylZoH0WSXnOKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dK0gmcyL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XTa8UGcF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668dLnb048986
	for <linux-gpio@vger.kernel.org>; Mon, 6 Jul 2026 09:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cvVHQUpzx009aA9mmeSGuOWTFjrnb86PTT/hoxJYOM=; b=dK0gmcyLM7biMCjv
	3wFOKUN526X6Q0vlacvGoA3jp5sBkA6/E3x+LWCj7R/KiDrCaWlMzlkw8gnzuBng
	5yijy1Uc/+orpxBi7AsouImZFASF8ND2EXFepsN5Eqt6/zZUz10rs0HIVfvx/EU9
	Yo6wR7diLRbDSylQIFZnp+NKB6YDTnJqvUML4bsK5JDhGeQU48nG9/No/x6j2kG+
	PqojKc34HM+5fcYC063WxgWEBUNQqzipu1CimpVyHiplgAj7zguOywOXDGEU3WTG
	0J+AwK2CR25wHPRtcMaErzVsQ/4T6xwdsvI4uZNCqYhcjBgQgAOlTvM5TomH9Etz
	lt+JXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891ur31g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 09:03:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so282964585a.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328618; x=1783933418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cvVHQUpzx009aA9mmeSGuOWTFjrnb86PTT/hoxJYOM=;
        b=XTa8UGcF2L83nAg8VuzQ21jRkk06vkdJYYKq8416yiIououtLyhsxB8EhJUhrpdadL
         y3ZtIEA2BiodhKBd4eXdVAO9PVOgWbWuBITgSDuF7EEKGIwg+gF4l71XDkxetjV9GbfY
         xfzU2F6hPzw2NydgSKeluFZ6dxgAGFEmhc4RzfZsnKEREPEsI/Ui1RnPmFZNoxqM28Ic
         ZkLQ8/EebQGSYoDuiCRa8hqbFPVIsB4QtyclNpzMQJ0EoqSaTr4Rgtotf8OMuJoRDkaq
         YGtCC2hGw7jEHcuKgnPNCmbP4i/qI+LqdLcmZXbah6ydKw5hN7IR11mLr6ctD153T5Oc
         urVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328618; x=1783933418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0cvVHQUpzx009aA9mmeSGuOWTFjrnb86PTT/hoxJYOM=;
        b=aS7k2s6EH2yuW+OW9xQU0QD0zzTTAZtOiPwOK/2lz6OjFoppRgazZgHxyr6CTBdTnk
         oLveRtaPafY+BuAy7XlH+gotsioAA+bzZYgqDir6M5OwN/QHwQXe8nb0VC5Af+DyLBpw
         rbU8M2DHAZQe/YD+RoSXfNkX1s3BMUKZkzzLxOEz7QXwt/GJy1Cs0FS7KBb7WBdLXsgp
         /DPF8dyh5qf1d+U1S6nSpWG5VUP18RhymgN7eK3JMSoe5uNnFQXqQfkSxryTNAAZvFUW
         McOc86Ceq8dm4xl7Hr/v7wrlNRy6NVocEan0O1soHgDkUekdHHk8jKvdgseD9JszWGJF
         UBWw==
X-Forwarded-Encrypted: i=1; AHgh+RqYFWYwAaE+M7xL+UFIPupAxWcw38GklAW6vl2wXtSfm4z2kTBaibu2tD4PQnGlD4tzV6MK4l0aH2Dt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx96pwlaD9n+mSp/Pyj3SxIIK+mxuYz87kgs4yOExXfTIzVO/Gk
	VYL4XMkAUZAMsCjknLLXg2y6/nviMTcsrSjfOg8eJhmbirXbHpArVI8pReCgw09+b7AfmmsdcEH
	f9hQNnJl961rCvnFPC7IaGmEB0qN3H9xWRollY9XLhSJUQOn5s8BIizjVqg1iilcF
X-Gm-Gg: AfdE7cl/otILMXVL3yKKJyyKTM2DUF95WHMZAMMNoOCE6IXdyxe25td73sgdciI3GX4
	sYU8i0U2n9+eJO/TbPQFhkjScTGC6D9212jEM3eRtncC7ka0J//3yJXfVWcaoLQHsmdcnau+Hhi
	POjciuJM1s/lnT5HPp1inPZn7n5AQps+B8cu5ISOKrSGJGXW3/rLYtkiNHA9srBIgDQbUBVXEMV
	MN+fgqA1F+gqUPgn0VcYVxuu/dkaY0synxIX0152+RAzWh7NaSUVIDptqCUIHGDEWeqh1RjgY/8
	uv1DqSeykh8dWxurZnPLnz6mY1L0u1FzH3Y61/IX8J4+73fe6Ia4zZeWyUbp2BYkkNNHPIneZnc
	BMw25xZRHg1ppXlUrvXIwtpIqE8ZzyZW5FCpOnys=
X-Received: by 2002:a05:620a:1b87:b0:915:8d82:b149 with SMTP id af79cd13be357-92e9a3a7bf2mr1291640685a.27.1783328617688;
        Mon, 06 Jul 2026 02:03:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1b87:b0:915:8d82:b149 with SMTP id af79cd13be357-92e9a3a7bf2mr1291637785a.27.1783328617271;
        Mon, 06 Jul 2026 02:03:37 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef23feasm326998025e9.2.2026.07.06.02.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:03:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Paul Walmsley <pjw@kernel.org>,
        Samuel Holland <samuel.holland@sifive.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sifive: add missing MODULE_DEVICE_TABLE()
Date: Mon,  6 Jul 2026 11:03:30 +0200
Message-ID: <178332860259.18708.8157859220968783095.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260704122230.75964-1-pengpeng@iscas.ac.cn>
References: <20260704122230.75964-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9sX8KO_8S37-7L84huh0nijXmBOvnVyz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfXyAf4e4eDGLVU
 Htgg1/jgO7EjSForRzqs8OEM+KzQFZQpEoSVYOdluPSVb17kFFbT9NPQAtW4opp49sqUQmshMOE
 5BzqU/nYBWlnSBg5x63vaLSZvpsEHY0=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b6f6a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QiFXtDutrJn2_FFymrwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX/SffEeljcDn0
 R+78LASbgQORJPNT5Gk49d5gp0HEafB1lQzpBFLgcKojqalH6bUmpbYqrVWObapjLrp+LdBQyiq
 28dkoQsX50gRyxZtSJDIQ59c/KIQra3nmhETdkx6YKbNjhRE/47J8mESHdfCWQSMlhsTvooAfpd
 6emBWw1vCAs+xJxQGcDSIbLNrqTkpRVMmzrRJGeGbqfqNkc4SgaMygpV7W5rSyWvNhbPvazA2Ag
 Efa7f6v7T252I0I/YIcSkUbB1dcpjLS+CuGbbxO3rf83eNbh/sAQ+l347Z8oayulyxQs0HXng3L
 Gcaea7HFTzijBN4u0LRZodHPEWFesVRkVZWlBwDlYfNNEwTNIoLCaulkkkMWxU10JF64Hy3LWXk
 RX/9jZ1NL+mdSO+KcUke4UCAklxYQdBk1EL1j0/UHNbb9WUuWXlDoNJEpfockJaLkIhTscqWG15
 2DNCCEQJZMYSMoAuYfQ==
X-Proofpoint-ORIG-GUID: 9sX8KO_8S37-7L84huh0nijXmBOvnVyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39499-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:pjw@kernel.org,m:samuel.holland@sifive.com,m:pengpeng@iscas.ac.cn,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AB3B70EAB3


On Sat, 04 Jul 2026 20:22:30 +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> [...]

Applied, thanks!

[1/1] gpio: sifive: add missing MODULE_DEVICE_TABLE()
      https://git.kernel.org/brgl/c/8fe6fa0f223f44b8b869319d1b9c383749aa147b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

