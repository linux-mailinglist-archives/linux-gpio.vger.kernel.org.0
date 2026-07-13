Return-Path: <linux-gpio+bounces-39954-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id utnaMySjVGptogMAu9opvQ
	(envelope-from <linux-gpio+bounces-39954-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:34:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A130748C03
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:34:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H2lGlx3m;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PSUfqBjG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39954-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39954-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01F8D306623E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 08:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2273C38D417;
	Mon, 13 Jul 2026 08:23:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2773ADB9A
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 08:23:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930984; cv=none; b=chaxAGedVv9cOnjdyvUrF9+84+yg3eHom6g6dKpB1b5799tauxhr9GPFKz5n6D0mxO6Rx4PTgI3PREwch3rueuRj04MS54vEIwQlQaNkj1mQO7wYzJRBg43lhAWgOeTWmEV3VFxAcyW3dfrEJ2iDCfvImyQtG+XnT36DbPnB6HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930984; c=relaxed/simple;
	bh=mBQPkMoiWy5TKhTPFTkPZNOAUwu+C0qX2CCklwJ0C0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QkZ3Lf9Sm7YDCspGoZEOoXS+tX4LvPHQnjBS+kDyut0aZnqec000NRK1ulbS9E4a4uQWu1YcGrdAHDWbcEDcvYiC4GCZNLTlT237R9iiK2dcH6Y6fty4zFLisR3ZW9oXN/Sy4+RDlpEvdDdVyFqnHsiVN7wnGoN3IFj0uu2qhlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2lGlx3m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSUfqBjG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nij7507094
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 08:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7tWiFY78LvScyrxxqD7WkgBH/ePQqaMiKpodGn9aZY=; b=H2lGlx3mWUoZRaRV
	OM1wELfYEEdy1eUQs9P9KdAF1jaoxzjFtSbG+hx4oJEhwpDqtX58SbnESgp7ECGm
	HwwE1YC51YecSN4fUIUlC6z6xkZHxtnRIhJF8Hx6DRA4kWsoi1trDIIuSgT8ksX4
	n1IFcSQjrzzfmUKeFomlhxRg9KltEce4hMUgM10Jtkh/hMPAGDwJIsFpojKHPEt4
	sMAGB5jz2EUnE4RjzTp4jXElXLmHTjFWB2Goef+sQAXJxLHF1ZQlNYoSvnnRelq+
	9hsA7mKp6JCpO9bYuUFieBmmCANHNIJyGZTmJz+44gr4NdKcH0cWWWBYR+cJl3i3
	cQooNQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8gjvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 08:23:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0c46bfb6dso59946706d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930981; x=1784535781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z7tWiFY78LvScyrxxqD7WkgBH/ePQqaMiKpodGn9aZY=;
        b=PSUfqBjGJtLNKwDzmsiaqokv9x2VBMQy2mPGgIiRFzq4/7YdnD9kzCMV4mKR+Ls7FI
         jcxdl3CPx3UYBsUaCan05q52egelGIJnEDE6tMnVP9aqfKeiuTP1LqTcXB8ma5p7Ozl4
         oE0VhzyOXPXYjrdyEXCp30hKnQ9xArfO0G3mSTWG/Qf1TU/dwUE+IBhbCKh8cVGH6fyt
         bChAboC1eJ8UyyEH/jt6ygI7lPu5cU7T8xFYCBGOgbOQJZKt0JUT5DuiKP1i/oeHQWr5
         lD8dRfI12NrWZbDvkTsXwNRAbiTiyjO3TxenL6SCypLmCAQohyGeeF82GHdMAo+SomSH
         w8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930981; x=1784535781;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7tWiFY78LvScyrxxqD7WkgBH/ePQqaMiKpodGn9aZY=;
        b=Sykn4ikedC8UHjg37UKTMeC6NZQdAzmxvaW6n8m3eNWvjuuy9ie7XYM+vrzjyf9Uq+
         jM9rL0Ocpr3mFRBZo7wTbruvTY4XEBSV44nDGJdCzFHThBOrYznpxNPJ7IbcFeTnDMjx
         sx+LuuIPMyXynZ9mNbQXwBO33d3itzLLMXJQ/pfKTLbeBwjWoIQFd+P8bJZERSzRv2Ra
         +XSHF/abB0khg5F0B6KUWBw5w1yJFbtxweeTYLuHq8gImFg9ltLFX6UsKUDLM3dqJ/ou
         12tdKuZLazg3LGVM2xyLBH/avpWnrpW5oe1AXjO/c81Zj+JzQaPmP5cXFtelesdnJ8uN
         Q1rg==
X-Forwarded-Encrypted: i=1; AHgh+Rpuo+LeybPvnsLw4iVK9wSOuA6z1Cq4PGrMJVJ9NbtXHt0mM8AimFpDMxtsHUZRNpawg4Auu+KqsE/i@vger.kernel.org
X-Gm-Message-State: AOJu0YwNkZdgF+Lpwvt3eVc5yfEJG4cXc5pYDtA1lLZkMkJ72hfJ4uts
	W4jl3S7DCHWHpMutS47CHZHPhepLXKl3shc5oOA6Z7/qIFrbXmqZlTvBWlJPEY3cUjkT/60U6Na
	nFK9OISYVoPvlBI4vMhCzd4SqWsNeOYNygjU6Wd2cmhcEagZSWL/69duXTTNdQfWf
X-Gm-Gg: AfdE7cn/ye7KXDVM7aDpFNlf/AT85jjXjfe+3rEhmXpzcPZy7O239J9mBpdyaHi5Fjj
	gU1DL1y7cVkntKUTWuzxaM16nmuGh5Trz1KaKN3sGF9NAmwfq/QRNcyvzxi4Wssvw9lgfPoNQEG
	BRygkxonuPn7P130mHQzG9FzRsNx6ALWiI2Xl7eyLdnn31DdVYlBz/+t5e3Qs+u+xH7dnH4HD08
	f3VWiLsizVG6THKyBwLS/E6UrthEMtzV6FDD19nH78GfkEHvJH37Vkmdb6+CraSmulKz9jhKU+N
	WNI6p8nPiSbIETTNj1eaLssbYAqOQgO43mKayFpnviZhUiGYU3We5C5TYCByPFaaggozzGiiWkR
	Q0dctT2ORkcIWe7RDe21j+cIkX8iiXcQuBIWbF/8=
X-Received: by 2002:ac8:6f12:0:b0:51a:8c9a:8fb7 with SMTP id d75a77b69052e-51cbf30ebd1mr82197191cf.72.1783930981101;
        Mon, 13 Jul 2026 01:23:01 -0700 (PDT)
X-Received: by 2002:ac8:6f12:0:b0:51a:8c9a:8fb7 with SMTP id d75a77b69052e-51cbf30ebd1mr82197101cf.72.1783930980737;
        Mon, 13 Jul 2026 01:23:00 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960816sm80796364f8f.29.2026.07.13.01.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:22:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: vf610: add missing MODULE_DEVICE_TABLE()
Date: Mon, 13 Jul 2026 10:22:57 +0200
Message-ID: <178393097523.9490.7348153815942299582.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260704122123.73004-1-pengpeng@iscas.ac.cn>
References: <20260704122123.73004-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FcIHfHaK_AXvWwfX6JFMpXOs9b3qX6Hp
X-Proofpoint-ORIG-GUID: FcIHfHaK_AXvWwfX6JFMpXOs9b3qX6Hp
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54a066 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=E0u4kPbQtVN01mVgidcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfXxi1cBfSeXlV4
 6KZQD8y+U3AfzAPITg9kgc7Ss6fgnmI/N8k2w7GTmTrgtcO9xppHvdKS5RyLOsrmSqWGeLOLzcU
 PDpOrvl8JSRIkBsUDjoTQM9lDL9r0Q0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NyBTYWx0ZWRfX6XDPAyjjTgF5
 00yXaTCAaJ8Trln82G/WNQZY1gLuN1Cu3NtsxdTND8dnHKwPk0pbv+H26MCi3pXucoH/Kr5OhTu
 Bnauh/94is/umT8yCEFkZyqW6Uk+TCPnCQFp4VrlBO+bVkUtjjV4t3fivliJmTgZuyxs83boyOM
 OrvetxBRDhhIuY4UzxEi7nkafweDHBTunG7x1PyubMtltxMx/OfP82lIEs9AgJFpqZFPaDrK24J
 p5ZVr2qY0WyFlUrxz7ifFTUWiO1OFoxBhDjvBsIdHNKP+cBB56qjAjKvhbNoex0F2a8/YDf0oRp
 hR7ttRF3LRotXScUszxbH1aEVXcLPd3+bDIFatdokZIG/39t2SpxDG5uKuqa9C3/9qrjZ6RsfMO
 w3kbG/0loDz4CqnZv4w2ib8Lf/E3rYh8MvCd4SpngkiwovUKMr0/MbVNkM3cWm5hAQm4quOCSgP
 MEBJ2gDfYvVRrsk6wEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39954-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:pengpeng@iscas.ac.cn,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A130748C03


On Sat, 04 Jul 2026 20:21:23 +0800, Pengpeng Hou wrote:
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

[1/1] gpio: vf610: add missing MODULE_DEVICE_TABLE()
      https://git.kernel.org/brgl/c/7a6426e72ab53c7cae34952528092efd2e26edc3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

