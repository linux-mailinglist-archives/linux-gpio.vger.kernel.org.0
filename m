Return-Path: <linux-gpio+bounces-36706-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL32CMgoBGrGEwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36706-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:31:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E2052EA74
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 09:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B697309B0C7
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 07:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C8D3D6CB2;
	Wed, 13 May 2026 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XizRvr7r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqmETebq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D393356A0A
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657454; cv=none; b=tZhPTHVh7Y0bKWSVjzggITBzHl1M4Q2RDyq8BTLMBYUU/RgpBwUyZa9S1yX94m9szEVnx8NmBkpip5mWbXjtCIXurxVzurSTZ0DBb3CN40ZPaTb4mLwQtBNTwmdZY45oKxIbHCYJyBzSrFbozNLv457n/gU36sHrLMAnQBtg0mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657454; c=relaxed/simple;
	bh=ukvh32brRelqSp7Fv7hYFEkAzrj+aMDUtsm2nc1tQyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jw6CJJG9DPFGPJ/9hGF+nQtGnXldiVf/bFeciKZ16BSEuxQWmyoa7+vmV0xS2Ulw01SpFUQANcRQsN6K4vIUbnVsyijDwuwFWUonjnYhJEcGXefSnlGGwtRNuc8o/mXw5XzXJh5iS/Q2nXNZ6fxOI/sr71Qqz0yYPGOCRb8oWLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XizRvr7r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqmETebq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pFEk2338896
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cPqkf7KGuEQNIuHg0FdC6AIR5xbIzVEIZFla5BSLQVA=; b=XizRvr7rKeC51Bav
	NRHzaOrP4tUnNO071pVYcVxjacKC5uite+PkfZhEDiV5C845jGc4VHD59qEoW5ie
	Q0MM60jHTQdpCIWpVmyC8Z1+RE6PyXSbzEM7NIpsb4YNNViKGnAVWFlzEm+uB5iq
	GnB+dsyCWsT/ytAiKL5Vn7WEbHLcgYWcjOVVMv9sy5M2/0HpN/rFHE/nyu3Bq6wO
	/G9L0ptMs06m/ne2V667bA0eaZb1XpijwxQyYa1SDo9nP0LcAdW6d+xgf+ly13N+
	9J7ekWINfO+WockGYFA2IJfDFNeu+hzKV1DQGfHjwuZRkJ+HlifI1P5YcI9tU1nE
	8ysxTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxa90x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 07:30:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e2592ea3bso37242181cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 00:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778657449; x=1779262249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPqkf7KGuEQNIuHg0FdC6AIR5xbIzVEIZFla5BSLQVA=;
        b=LqmETebqfUMkNeFgHDSRVI80KQSt+8BHjJD6IJnKo5DIvaGZ+kZ/HrFa41byofNePs
         BqDkYm5Rk4DEq9SYBSXj2IB5snfv8U8bEBH7ynXKja3S28nqJMq+CL2sd4Xrqcmx9eIl
         m4U5VvS3XN6bRVWdZCqichr5oqvZipo4JeZgzgNrOYEyXGPgLJm2TbOJETqp21V6Io2l
         h8S5xbw6825Dyck9j2sb/Vz/qZQnbu868sVN7AxwLqGbiQzEwKXxQYJqIkFj9cqnsGD8
         bbDDjNngkMhjMNNt0ugC2kI0on7lzbPsfh9dX+RD5LdPRe2nx1iKXfhcY+qe2SNrqmfq
         B3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778657449; x=1779262249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPqkf7KGuEQNIuHg0FdC6AIR5xbIzVEIZFla5BSLQVA=;
        b=GSuUogqpTEQ2Jy9JqabP9aDOMaLVWPbz1YCEQZ+0uSq3Ob5z2j+Yu+AcRpKAhN5xQm
         NJdJfuU8GpSfyuC1tikK0JKWgd2NqrW9r3lOT8CK6/O0zpQYoEv3FxUT84SXjDuZ4J0e
         IiuMHpR7FFgSxgIGEloPlfb36/8odDYzPvnYqvgMJZQ2KruxiNymYrgA2/k/VYDQJ2V1
         Rbd+xXEtJTbVHSkE6IOMRUx/RVHjGrLQ5cBa6j9GpY7JyHz8ONCF2WmCzXwgJm9INJWl
         gVB0k/r/E+ra8VZnhHjIFy1pxJTtf6U3rrJqXtWPvV8ptqO+0hOPfTDOJ6YhmHduDv0R
         uoTw==
X-Forwarded-Encrypted: i=1; AFNElJ/5BFrWgCtFfRiXwuHynbI7GBfE5ke9/wj+kXTb/nE++4QUjLC8myv2KRF7mJrciTY6xYjjJkd2bJIS@vger.kernel.org
X-Gm-Message-State: AOJu0Yya/IuNErbe6iZz+VQOzP5CQI3ycfKvz3952GpvY9RCg8oRwxId
	ZzdzPyx7lc8ek9lfwW+++y3bE/eEssy9fz1PGZ6f6zIdQM6kZzoO+OWnI+F5A+mu9vfuV2yL7I5
	QZ+sORSiSD9ekiau5OMQ5b6IXmQS+kh9Eul/hNySvnhPzf60TkP7gPFBG36t5eC6m
X-Gm-Gg: Acq92OGuo11mQhXM7Wh0JksAN0puap7/oPcInkPK0KIHNIhMxkWfCE5GxFzkdWvwAim
	7kFqYAF26rrORYSHYlAybXS7qvTu1ysSK91MGI15A16rvofWGJnyvz0pC4HCedM+eu/vrDQWGDp
	JObILmx3nr36JZd1od9yn8xEl1/cZvRVtOPpkqdtsaEcBNHiVMSeqpk+xLg2cOpI6jJ213hPwW1
	wrR0gl/V4CS+9NWLWqr8RINIFzrvkSYGndKeP8ntm5Gyu91ivqh8sYYISUWz+Aoilja29EMULZ1
	C+vkUpdWlll7mE8G4aJ188GKOj+Fmx/dy5m9OcOlBnZDx8uVUpQ7PkSCKG27wLgE/BcqJeugx9m
	AGlIdvJbpDQwxDWa3WK1yu4dKw/5/+lHOETQ0eNrWEsQVT/eQ
X-Received: by 2002:ac8:578b:0:b0:50e:635b:5564 with SMTP id d75a77b69052e-5162ffa9c1fmr21299961cf.48.1778657448703;
        Wed, 13 May 2026 00:30:48 -0700 (PDT)
X-Received: by 2002:ac8:578b:0:b0:50e:635b:5564 with SMTP id d75a77b69052e-5162ffa9c1fmr21299651cf.48.1778657448240;
        Wed, 13 May 2026 00:30:48 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce05f41csm47977105e9.5.2026.05.13.00.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:30:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, git@amd.com,
        shubhrajyoti.datta@gmail.com, Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] gpio: Add EIO GPIO support
Date: Wed, 13 May 2026 09:30:45 +0200
Message-ID: <177865742113.5804.18266308957127851579.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
References: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ue1whmYRV15Cy_5dx4m4mh713hMbmr5s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NSBTYWx0ZWRfXxT+KscM7aKtV
 fX/bLpEfmy0acYUXEjbGojhkrDeCL8Ew1dRIDsRbWWr5TCp68Tzu84alNtbsGl8UfBXAOP+g45d
 S2liox2ctXjgd/6fM5oUR+urBJ3ORgGwQF9O/JhOVKwVFe+KVRmHg3s0sLc019ZqQQeTZX2ridx
 8gF1GYYutUCiq7aXtPzkENTTVbgwytgOMmRny1+UGc6SWAX8PTxGVGVqYB4uMgHeGGJXfR7mRpU
 R49II67LK35Mf052TsMLMNJSyydVMcMhXDYiDGn3OPMyms7yTugSwTZDXqUooERICwkYVs5EIsr
 s4fVVNneWhxoJ9mDZaiB5WP4QcGAGcTY5zsM1ppzHHMljNyr7aBRomKZuJn/ESEynS1Shoet1sh
 7YWY3QGVZHlX7arjngVeNatHwUvHPISWwWPz9Hpg/5E1yZ0cwf9kqJhajUQsGJqGshmymAmFCNc
 XwJDgepkIe+Cy1x0Lrw==
X-Proofpoint-GUID: ue1whmYRV15Cy_5dx4m4mh713hMbmr5s
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a0428a9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SWcx7dvh2R5ZX5NTVYcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130075
X-Rspamd-Queue-Id: 88E2052EA74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36706-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Tue, 12 May 2026 11:38:46 +0530, Shubhrajyoti Datta wrote:
> Add the EIO GPIO support.
> Add the dt description and the compatible to the driver.
> 
> Changes in v4:
> - Add Conor ack
> - Remove the min 52 for eio
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: gpio: zynq: Sort compatible strings alphabetically
      https://git.kernel.org/brgl/c/3eb639ef8da2d418ae69f3c8840c4e815036adc6
[2/3] dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
      https://git.kernel.org/brgl/c/18409d06b4a002cb8550ad7c20273bedc77851df
[3/3] gpio: zynq: Add eio gpio support
      https://git.kernel.org/brgl/c/eeb1d6dfd89344b17afe845d4839b79e37fdd547

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

