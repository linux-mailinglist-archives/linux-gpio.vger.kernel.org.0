Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2FE612A6BE
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2019 09:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfLYIUf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Dec 2019 03:20:35 -0500
Received: from mail01.vodafone.es ([217.130.24.71]:6410 "EHLO
        mail01.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfLYIUe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Dec 2019 03:20:34 -0500
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Dec 2019 03:20:33 EST
IronPort-SDR: ioyLoO0DhPTfCzgg+SHUFozyO+a8RP5R1admDg7VrA3FFSFMZmzKRbN1PFyyVPdOi8HyDdkdBp
 WBDhaQXMR3Sw==
IronPort-PHdr: =?us-ascii?q?9a23=3AippbDh8JQ+YbWP9uRHKM819IXTAuvvDOBiVQ1K?=
 =?us-ascii?q?B30uscTK2v8tzYMVDF4r011RmVBN6dsagfwLWO+4nbGkU4qa6bt34DdJEeHz?=
 =?us-ascii?q?Qksu4x2zIaPcieFEfgJ+TrZSFpVO5LVVti4m3peRMNQJW2aFLduGC94iAPER?=
 =?us-ascii?q?vjKwV1Ov71GonPhMiryuy+4ZLebxhGiTanf79+Mhu7oQrTu8UKnIBvNrs/xh?=
 =?us-ascii?q?zVr3VSZu9Y33loJVWdnxb94se/4ptu+DlOtvwi6sBNT7z0c7w3QrJEAjsmNX?=
 =?us-ascii?q?s15NDwuhnYUQSP/HocXX4InRdOHgPI8Qv1Xpb1siv9q+p9xCyXNtD4QLwoRT?=
 =?us-ascii?q?iv6bpgRRn1gykFKjE56nnahMJwgqJBvhyvpAFxzIHIb4+aL/d+YqHQcs8GSW?=
 =?us-ascii?q?ZdQspdSSpMCZ68YYsVCOoBOP5VoY/nqFATtxW+HwisBObuyj9Uh3/2w7c12P?=
 =?us-ascii?q?kmHAHawQwgG84BsHXJo9rvL6cfSuW1w7PJzTXHdf9WxSny6IzWfRA5u/6DQa?=
 =?us-ascii?q?h8cdLNyUQ2EQ7Ok1aeqZT9Mj+Ly+gAsXKX4/duWO6zkWIrtQ58riKhy8osjI?=
 =?us-ascii?q?TCm5gbxUre9SpjxYY4Pdi4SElmbtG6CJZQrCSaN5duQsMlXmFopD42yr0Ytp?=
 =?us-ascii?q?6/eygH0JEnyATea/yDaYiH/BbjWPqeLDtimnJlf6+wiAy88UinzO3zSNO430?=
 =?us-ascii?q?hRriZdk9nMsG4C1wDL58SZV/dw/F2t1SuB2gzP8O1IP085mbDVJpMh2rIwk4?=
 =?us-ascii?q?AcsUXHHi/4gkX2i6qWe104+ui17+TofrTmqYKGOI9vkQz+N74hms27AegiLg?=
 =?us-ascii?q?gBQWyb9vqk1LL54UL1Wq1KjuEunqnDrJ/aPdgbprK+AwJN1oYj6hC/Dyqp0d?=
 =?us-ascii?q?gBknkHNFNFeBWcgoj3NFHBPur4Ae28g1uyijdrwe7JPrn7DpXKNHjDn+SpQb?=
 =?us-ascii?q?Eo709a1Rp2wshe4LpKBbwbZvH+QEn8sJrfFBBqCQGsx/fbD4BZ38smQ2OKA7?=
 =?us-ascii?q?OYLqqa5VuB/vguJuiQZZEctS3VOf8l4PvnjHt/lEJLLoez2p5CTHnwJu5nJk?=
 =?us-ascii?q?SFYGTlyoMdDGMBvwY3V8TvgVyGFyJeY3uqVql6/i1tW9HuNpvKWo342O/J5y?=
 =?us-ascii?q?y8BJADPm0=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GEKgBkGQNelyMYgtllgkQBGAEBgns?=
 =?us-ascii?q?3GyASk0JUBnUdihKFM4N8FYYaDIFbDQEBAQEBNQIBAYRAgiIkOBMCAw0BAQU?=
 =?us-ascii?q?BAQEBAQUEAQECEAEBAQEBCBYGhXNCAQwBgWsihBeBA4EsgwOCUymtEhoChSO?=
 =?us-ascii?q?EcoE2AYwYGnmBB4FEgjKFAgESAWyFIQSNRSGIS2GXfoI+BJYwDYIpAYw4A4J?=
 =?us-ascii?q?UiRGnIoI3VYELgQpxTTiBchmBHU8YDY0sji1AgRYQAk+FQIdcgjIBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GEKgBkGQNelyMYgtllgkQBGAEBgns3GyASk0JUBnUdi?=
 =?us-ascii?q?hKFM4N8FYYaDIFbDQEBAQEBNQIBAYRAgiIkOBMCAw0BAQUBAQEBAQUEAQECE?=
 =?us-ascii?q?AEBAQEBCBYGhXNCAQwBgWsihBeBA4EsgwOCUymtEhoChSOEcoE2AYwYGnmBB?=
 =?us-ascii?q?4FEgjKFAgESAWyFIQSNRSGIS2GXfoI+BJYwDYIpAYw4A4JUiRGnIoI3VYELg?=
 =?us-ascii?q?QpxTTiBchmBHU8YDY0sji1AgRYQAk+FQIdcgjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.69,353,1571695200"; 
   d="scan'208";a="298594790"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail01.vodafone.es with ESMTP; 25 Dec 2019 09:15:29 +0100
Received: (qmail 32157 invoked from network); 25 Dec 2019 04:33:51 -0000
Received: from unknown (HELO 192.168.1.88) (seigo@[217.217.179.17])
          (envelope-sender <tulcidas@mail.telepac.pt>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-gpio@vger.kernel.org>; 25 Dec 2019 04:33:51 -0000
Date:   Wed, 25 Dec 2019 05:33:42 +0100 (CET)
From:   La Primitiva <tulcidas@mail.telepac.pt>
Reply-To: La Primitiva <laprimitivaes@zohomail.eu>
To:     linux-gpio@vger.kernel.org
Message-ID: <2745360.259361.1577248422442.JavaMail.javamailuser@localhost>
Subject: Take home 750,000 Euros this end of year
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Attn: Email User,

You have won, you are to reply back with your name and phone number for
claim.

La Primitiva




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

