Return-Path: <linux-gpio+bounces-31711-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FA+Bbv9kmkn0wEAu9opvQ
	(envelope-from <linux-gpio+bounces-31711-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 12:21:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D426142D47
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 12:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7170F30138A6
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 11:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA322D4816;
	Mon, 16 Feb 2026 11:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRCtrV44";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHzgkBso"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7EF3EBF24
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240886; cv=none; b=ZZX1uqrfFuV1lO2PvJ4NCQQTyQR8AU5RZDEA4tikUyqcumxlNMiPuP62S/xkk6FRtFsraS5Ww4hcrA7vsEXT5V73iNTIIppCmS967les0AeyNdUDbfznjXkSy/X+IgXKdwaluvjoMOkd4B9YtpuoUCSfhvHxbjsBS3rSo48HoSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240886; c=relaxed/simple;
	bh=BX0pESXBVfwa/YbRdWSL3gO2EmUKlWPgEHL1RHd60ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDMyXZ7TkkFGY3RXoo7e5Mw5s+kBY3Nh8ectk+jgTIXwqYQ+UuD6+rTg2wcDl8H4TCfHOHxb0KbzJwLBN7K/CjWqavJmZY4ucscTShwMHc3COVZeRl7WCTKp+t9VoCX6jFsXfq5HnhAypqoqytHf+FNWO8O1rbC3tsrUxC7w8ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRCtrV44; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHzgkBso; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G8geLN2803486
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 11:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtNogbTkelkeVJxZ8aDQUG8mpqbiFBJlXGbcS7O0z3k=; b=bRCtrV44fA9Oz/WF
	kk9BXGZ/IM5kc6DbjXRw3UCil3XFUTA319+PNieIxSiockm5CjdpvJbYu279JSml
	fxoTedNnuYriFkriYU0K2djs1F2pdVttl1Y7h0mu3yInVK2Y4ktgaDKgC3DN1KDI
	8xt3EIiQe7lzOU3G3MERlAxhYMefEwo1fE/vTrlIMdjyMM+HiZyPpx5i7IWKx9L0
	jjaukPEdeq4+/TILhoyxTZhlBAz+QJHesGVvJDIkXmUaXAufvNueJoN1HMjTHSrM
	daCh4Z9rB/o5scbrx0FMxz074rvLHJmEEdxALC9eazAhChuuCyC+WSivMXht07kf
	iJt85Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxugcve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 11:21:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7166a4643so1850531685a.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 03:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240884; x=1771845684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtNogbTkelkeVJxZ8aDQUG8mpqbiFBJlXGbcS7O0z3k=;
        b=BHzgkBsoc9KDT+3jK7dmGKQ13S8wK6GwUSO8tQAdhPd7G9ybxdbltf1nfbvSTC3b3r
         ReCgAYPVbW74AkjYgdrXVdltwJhcJW9BHvx2dQWqnoxuyRDFGH4QLVsspPy4S/Czp2zk
         vhrCn2SmA+p28CWB19dJffnIEVHcKPdZONeIcVemvzXaoc5UKfaVc4RGUbDyXZXGgAIi
         TXl1j3hLPKDp9tEISWNBclr2wl+0krTWIRINefTOYWNX2o7vznJ5qEnlRo978dl9d9U1
         D1YvL47UjJvXfuura2Z7n3CyZF9si27woA/fwfrqEwyE7KWBm7Sa6rjws4X0OpzRB/73
         zhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240884; x=1771845684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UtNogbTkelkeVJxZ8aDQUG8mpqbiFBJlXGbcS7O0z3k=;
        b=hg3v13ulhBNuCUfoO6N+Qvftv0+Re0TkxxIJwNP53OSTbk8BAl2kssd6VKB24T/JAz
         aGPK6OmiWV0qPyaIjrzoTXyoZS0DT6EJrO5rFRiT4TiJAGqvhSLgIxJ1ZZEihi2Pt3zT
         SkF3zMbdQSVVXvtCb16TFjFQvQvx+1NRZFT5O/19ymM8nJqdwxsoKwFhAgzu2wg8cT6K
         p+tRDJqh19QohCdpRAhwZydGMiK8umvDIsHaaQsAXL0zNz6O1SV80ptfq4bQzGYpqBry
         TYYJbSx4HY/SumxUAjRE4AYRdbjhS/tTwS7hTPf2Ke/EZGNAw+F08S7Rz8Kt0zn1+Mrw
         OfSg==
X-Forwarded-Encrypted: i=1; AJvYcCVxw2kHs5PKsgD3Yi10G2fbYufRNJBMom/IK/NmcD63UWxLQouXPvRJU7MurWKWo47cERdqNn3x56Vq@vger.kernel.org
X-Gm-Message-State: AOJu0YwZIvtJLw+nyUTkItsuCNMm5MotQpX/4vzF8fyERTis610QpeY/
	kWjAwt0PRwj9vHGHkpcC6rmhL8B3j49MZBcwiA9o2sQ8RAq/4IoxsSlUjZQ8297z7s9fG+m/8iD
	3ke0qUZWtRXWf3lhWsVSbEB7/PeFY9p6q6mk3LpvDA8Ji8VGaTADq14gca7V3Gtvg
X-Gm-Gg: AZuq6aKaqCDC2nGd+iT88TjHg4uDmRX/7Lukm7V7v1dYEYLGbHn1J3VFrGeb1ED8Xtx
	TqsIc3X4FDzlRLkmNUqPQBJUbsZVJKz2r8owqBO3hihsAuiwikb6dDQ9p7yL1dfSh51+GGSA/i6
	N9AwesSSTsEzcxgC9Wj2kfWOmQYdRTB+i9iG5XXAt8HUINxumCHNV3VsyzimdaeQqrv56gKbikp
	r0m4t62+oAFZYXqL+W+NVkphL9xQbG0nOm4SjJzeZWRrUfWEU5cT7vR5I/bbjrxs4FBygTQul2K
	hwUF8Z7YThXjfEt9plFNRUyqudq+GHZ71LxkwQsrBHQwp+yyQmxNXQjis2cWJlc1OYmrzxvjCVe
	aks2G1xWixCfK0jczFrJbDql8ENV18CuZ4ch0cRnC7ewcMU1fLG4=
X-Received: by 2002:a05:620a:4544:b0:8c7:f6e:29b7 with SMTP id af79cd13be357-8cb424873damr1127080685a.80.1771240883867;
        Mon, 16 Feb 2026 03:21:23 -0800 (PST)
X-Received: by 2002:a05:620a:4544:b0:8c7:f6e:29b7 with SMTP id af79cd13be357-8cb424873damr1127078085a.80.1771240883418;
        Mon, 16 Feb 2026 03:21:23 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dc34:5caa:d44e:375d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc9b2sm24417811f8f.21.2026.02.16.03.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:21:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Christian Brauner <brauner@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: Avoid NULL dereference in linehandle_create()
Date: Mon, 16 Feb 2026 12:21:21 +0100
Message-ID: <177124086810.19012.4668276234393319371.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260215120555.v2.1.I77c3eb563271c21870379eefd16ebbc4e09635bb@changeid>
References: <20260215120555.v2.1.I77c3eb563271c21870379eefd16ebbc4e09635bb@changeid>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kbCBRLKaXGqkIfDsN_Vq_PLfW_r22G4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NiBTYWx0ZWRfX1VdYMLLJZp3C
 sOBVVehyJ2u/xjmaTEa58q7wmkEi0pszc/C9hv8aIGM4fcJd1p1mJmqxI6ZtxqjJUcEPd7GfrRi
 qIHBiAxkUq/xVKexQweCCqk63f+Aj4MAe2wSadAdG9b6A/YXpb/AQIXNFb5RiB/6j93AAxKnmpn
 fjgE4YBe0nHfwcVEX7GhmKlwxiHykK44tY/CcONaFvkj+Oi/rtppQO5Pom7a0fbHAfSjIKXbzMP
 NYJ+cziH5n4ZGyQ39XMZBhfn5I4ji5fQpycp8B7vMO2YSrff/fWeDAieCkNkfJYDE2ofT3Rnw1C
 zlGPT7nNpIV1nnfGFBiiMyHQcuLiMq5uPhSBV1BWtFOuSAhWsjlEH0KU+PUro8zNHxOfyliY6Ur
 5wrbZFl0HRU/x9rUht/d2Mc7c+2ODU3Fhxk3zj5Qpb6SZaPb1tKTkiUTyq4Itix6MUWI+8L2Nq+
 4meJZeiCAsiTgNSl2nA==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=6992fdb4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VDUHgC0sO1EGD_lEDVwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: kbCBRLKaXGqkIfDsN_Vq_PLfW_r22G4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31711-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,chromium.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D426142D47
X-Rspamd-Action: no action


On Sun, 15 Feb 2026 12:05:55 -0800, Douglas Anderson wrote:
> In linehandle_create(), there is a statement like this:
>   retain_and_null_ptr(lh);
> 
> Soon after, there is a debug printout that dereferences "lh", which
> will crash things.
> 
> Avoid the crash by using handlereq.lines, which is the same value.
> 
> [...]

Applied, thanks!

[1/1] gpio: Avoid NULL dereference in linehandle_create()
      https://git.kernel.org/brgl/c/6af6be278e3ba2ffb6af5b796c89dfb3f5d9063e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

