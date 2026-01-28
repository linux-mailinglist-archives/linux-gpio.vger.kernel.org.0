Return-Path: <linux-gpio+bounces-31210-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDndJIfTeWlCzwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31210-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:14:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFC49EB1B
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 178103002B54
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72A033F8C5;
	Wed, 28 Jan 2026 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSRbkEQ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h3/CCDkx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF4B33F8C7
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769591678; cv=none; b=L8MHj90SpA0VTVnPA9TNlYj/61zofYZKo9BvYSF4cZT67RGydClOrQIxia00clWJHiPnq4PmaeVPjxoduar2jTcZ9n61hirYBBPWzyRZ6/YqSTZBz/33WUZyVHp7R85+NmOFwB04P/NfKnF/uJdvRvMlzMQyi1ShdrFU31UMLQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769591678; c=relaxed/simple;
	bh=G8yvobCqGmOmVo1n/8m1X0wLwWXZC2o5FwOhnRN5W3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNzqCbzBpNnWT48IacTekGNUJr1/tAsvNLa7I3atYa5qoaU8xIdXyvQ99WblxnQU6tZGOADkKlfiJs0ZKJq6HHAApgFfJvwsrIuwa10bDoIM1h43zMNZsxmmlXOH6LmAi41w0B5laKXqckeaHdk36bCf39Vun8Ai7he6q8ZqOSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSRbkEQ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h3/CCDkx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S927VU811618
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5U9QG5VSHcJ/dxDheJ/jFVcx3Fk2DRSXe4El8V8RpY=; b=VSRbkEQ5jhJ8aG6S
	20j44yCroQLhSjc9CSjMv/9RYcB79LNWaiZF5xITOT0xMjKioqtcyRzzxowOoo33
	EDJWi+yt6+EEaMcrKT1uc8bmBXXnYgp33paZ9ud0RlugO3RA9KuAT/3wkz9ndPRj
	T5EtfuzMMCZpVtayBGOQfkarOb1dDrGKz9hoK4+4xaZgys3HFk2TpMvKIgJd3JrE
	p0nnS9bGrQtMfHzxQOx4x3TZHw4i/Heq2HWjFpc2kjqWGUbL/LF8c1ym0xBDwyVy
	ft5DZd6IKVQ85jx16liGwnrxSi+MTlaELrCOLSj08ctnWZ8qN0esI9PIfHZLNgYX
	BTwJAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbhsp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:14:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so260984085a.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 01:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769591669; x=1770196469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5U9QG5VSHcJ/dxDheJ/jFVcx3Fk2DRSXe4El8V8RpY=;
        b=h3/CCDkx8OQMUos/V5SpZncIYDCa+Z/qYVyXM+GLtrGeCEjxfYBLyUeusg4jaDRBOu
         2CVczEBgoeeMSvplwc/52lCc+9NFSiQCZAe5z82VNpeusR8BDHCddMxsmBA7x5G1UCvJ
         B7cvYXIDDWGq3/HfRNOs2kx7p+pIoYFxMuElnfRUPwB5UrQYsgPN/n73355Mp8BVQ1oD
         KLyEWaFZ3ixwHADEUVfWkdea+WYR9URb81INHjq6bmDZGLk0bjdd9+bHrxfiA/211n/D
         stySgFttpmyA68E/pOxdH6s1syqnoZoisnNMjI6PcECarjsklK91yEtHbChGhwlGc0LW
         cUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769591669; x=1770196469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X5U9QG5VSHcJ/dxDheJ/jFVcx3Fk2DRSXe4El8V8RpY=;
        b=XWyaGGofqiCRRsLiTQVQN/Eis+b8Hn3zv6bx9LvsO1VgtVqMjtNlhVSh0WoK5XY3mf
         E5JRa/UdQHJwTxgTKzadJegbdBbqTkZ8Db9xQgN/ohD3AGQll58/WPijz7y5UvBJAW/I
         TnUiwjMw8KbSuZk6Drgkwp4fqA0L48im/0Y2GvRiNUA0o6mdUD6aPCtAd0/udXyom5XL
         3MTdZExY+SqU/V938vBs6ZeXD/XlR/D030xgomkN8I3dfKrOVSpUb52XL56jc76I+ECV
         FK+c8yGthRtIRG4Gnt4h1RXUmF2Oj4S2u7kdaonmdWjPo1vDr3D0tia4JWRwHE6I4V8d
         F+WA==
X-Forwarded-Encrypted: i=1; AJvYcCWYLHQKBI2S1TT5iIMmh5hSenaxWADCVHhOTDAEWIdZ8kqUiiYgLveDZVK8i1iU8LK1zBnaNBZp64xC@vger.kernel.org
X-Gm-Message-State: AOJu0YwMzdpVNEnLq+DP28k0RkHB6X9EN9YOXu+77iI+6oigROlcS0p0
	YGvqNuUctrblJushr2/jzeCXiwi1G6fEFWt66pD0UfeF/ZaHNW82dqHqfEsGeiJ+NUhNqjC/JXT
	DK8iNrFBF+k5xii1ihzk6vIxYLNCE88y//z2eCUNC/ysY68UUX0OdOH0+NWC5ov+M
X-Gm-Gg: AZuq6aIOzNab9LXsrnSCXuRboDldTo1/mIudGtVeIbRvJMg/DUVf/tqU+EK11wJXJwC
	em1WVzZfB3K2b7MFoLQN+5wrnRxb3IJiO4oN2uD0WPCIyeNuUQT8jN0Uni+nvaeLeSn5Ms6DZZI
	6qN7JBJXkSf9jCbRMx/aHgrid32tkUInPMhA4+UH9SgM7hAqBz86AloBMST57Kzkf62F1W8eEBE
	H6u16XOGsaOF8IRn914wvQGQosvgM91VKydtlQ25nZbqYsw3rZeS2NKfUyuIZGu5RNW2v4C4B5w
	DST54hg6QYk1SHfLvvFg6nvseSi/0dr5IxP1h58pt4uCsKujfpatHm/VuUe87vstptomC+9yirs
	HVCN9hvQHRLJMFb6TfTWLQqLnhS9a2EBN9gWL5xk=
X-Received: by 2002:a05:620a:1a16:b0:8b6:134e:22f8 with SMTP id af79cd13be357-8c70b906547mr564976685a.60.1769591669393;
        Wed, 28 Jan 2026 01:14:29 -0800 (PST)
X-Received: by 2002:a05:620a:1a16:b0:8b6:134e:22f8 with SMTP id af79cd13be357-8c70b906547mr564973485a.60.1769591668975;
        Wed, 28 Jan 2026 01:14:28 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:6cbc:dfde:e62d:3195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee687sm176664655e9.5.2026.01.28.01.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:14:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: max77620: Implement .get_direction() callback
Date: Wed, 28 Jan 2026 10:14:26 +0100
Message-ID: <176959143448.10540.6948255479223614396.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127-smaug-spi_flash-v1-1-5fd334415118@tecnico.ulisboa.pt>
References: <20260127-smaug-spi_flash-v1-1-5fd334415118@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KdRh1g9zbxdJXFlo27nMhGcALZiVpVHJ
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=6979d375 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Phe7MmQ8q1vZaKp1QxIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: KdRh1g9zbxdJXFlo27nMhGcALZiVpVHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA3NSBTYWx0ZWRfX6VUgmmzH3yKF
 +c8ZT+dhC2EqaAxDOEia3u5QV4mAoBfSenmsKcsdnUlsrMlJIfRL/ZVfE7W8oOb3UMk/SVaHmPP
 gYcuVSURsJn3GuJANKQT/FFFRXxDGONgrklf3XsF317F/rH93klScDvcBQPA5f9x0jo2YlJxP5Z
 0WV+Mz+P44W2W8hh7SA9Dpkms0LqNEuSnTSI+NUx2a9CpZOB6trIUtBN22IR2FMQqOGadIt8U5G
 ugAtAlZQpK2fYYamQRKvb9CIQnFXWZ0V+734gxmAN/c1ZmrvDtzAm2uwaJwTfZKjQ6RuCEmETvF
 ST/U2L5lgYgqeBaURHFFcF6+xMBAk0+fYUwyCvttKi7TuCPoRoQjw9P85q6pYQT5DqByBnUB9pS
 XLvhVlWCoenNXiGCdXK1RUaK3O8MaLg8cKaYwLUYS7VVGYKjN8z/3qsOj792vjcISS+1QNjXPrh
 kiTSrSQKveqke+ulgMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31210-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ADFC49EB1B
X-Rspamd-Action: no action


On Tue, 27 Jan 2026 18:52:42 +0000, Diogo Ivo wrote:
> Add support for reporting the current GPIO line direction by implementing
> the .get_direction() callback for the MAX77620 GPIO controller.
> 
> 

Applied, thanks!

[1/1] gpio: max77620: Implement .get_direction() callback
      https://git.kernel.org/brgl/c/4c4ff6e38768f2431ed153f110f2d1fcce848af8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

