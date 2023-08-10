Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE41A776E1E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 04:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjHJCgi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 9 Aug 2023 22:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjHJCgi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Aug 2023 22:36:38 -0400
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Aug 2023 19:36:18 PDT
Received: from mx14.diba.cat (mx14.diba.cat [45.15.50.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6AE221BF7
        for <linux-gpio@vger.kernel.org>; Wed,  9 Aug 2023 19:36:18 -0700 (PDT)
X-IPAS-Result: =?us-ascii?q?A2Hv/wCmS9Rk/+E5qMBCGB0BATwBBQUBAgEJAQELCYFHB?=
 =?us-ascii?q?gEDARcDgmsBHYF5iDmRE4EjjnKCLQOHfhwDgS4wDwEBAQEBAQEBAQgBAhILC?=
 =?us-ascii?q?RwEAQGLXhYROwMNAQIEAQEBAQMCAwEBAQEBAQMCCAEBAQEGBgKBGYUvRAKGB?=
 =?us-ascii?q?gkGCwEfYAEIK0oBAgwBARgBCgEUUoIlgigBATKsI3iBNA10hF8XkRqbeAQKg?=
 =?us-ascii?q?nkJAYE4AYgAAYQqhVBCgg2EQD6DfyMBAYQRglEEiWqTHAQECxiBBAQIXzMDg?=
 =?us-ascii?q?R4bPQINVQsLYx4RCF4LgQ6BLwICBQMJOhNKBgQjRBsDBwOBBAQMLwcEMhsHA?=
 =?us-ascii?q?wMJFwMsJQZPAgcKIxQQCRMVQAQ7NzqBBIEbAwoHLxc4MwUHBBEOEQuBbVgrN?=
 =?us-ascii?q?jgUBwhDEoIuIwMJFQwqCzEOERlfEC4EFBiBEwQ4EycFFQUVDA0DAjkDDhIZA?=
 =?us-ascii?q?gsDCEAGEQoOBgYNDQMCLAgOLgMFAwQVBRUHBQUfAwshBhUPAzUFAwMKNQMzE?=
 =?us-ascii?q?R03CQMLB2k9AzIIChwBBgIBIyYhFhAFDAwSBZ9ogzeBKkRUomyhJAong2SKG?=
 =?us-ascii?q?JZ0LheDbgGXVxEBJ4FcjADAQgIEAgQFAhZggS0BgWuBR4EXCQsaQFxRFwIPj?=
 =?us-ascii?q?iwWk0uBOgEKAQEDCYkJAQEBAQIBAQECgR+BFQEB?=
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:/bPKt6HvIGPRbnGcpLqEx8eALOsnbusQ8zAXPhhKOHlom7+j5q
 STdZMgpGTJYVcqKQkdcL+7WJVoLUmxyXcX2/hqAV7BZniEhILAFugLhuGO/9SHIVydygc079
 YdT0EUMrLN5C1B7PoSlzPXLz9P+qj7zEniv5a4854kd3ANV0hP1XYBNjqm
X-Talos-CUID: 9a23:3qIKmmGUwX0SDVBHqmJEqWM/G+0VXEeG3X36eFGmEER0Y5SaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AmqdZGwyH6BmXelaUMpRYBi4+RmmaqPyHMngwjbE?=
 =?us-ascii?q?ogemdBQ5aBRmw3QyReIByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.01,160,1684792800"; 
   d="scan'208";a="7686745"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from swcs501.corpo.ad.diba.es ([192.168.57.225])
  by mx14.diba.cat with ESMTP; 10 Aug 2023 04:35:13 +0200
Received: from SW0394.corpo.ad.diba.es (192.168.53.94) by
 swcs501.corpo.ad.diba.es (192.168.57.225) with Microsoft SMTP Server (TLS) id
 14.3.498.0; Thu, 10 Aug 2023 04:35:14 +0200
Received: from SW0397.corpo.ad.diba.es (192.168.53.97) by
 SW0394.corpo.ad.diba.es (192.168.53.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 10 Aug 2023 04:35:13 +0200
Received: from SW0397.corpo.ad.diba.es ([fe80::5dc4:d67:8526:ca19]) by
 SW0397.corpo.ad.diba.es ([fe80::5dc4:d67:8526:ca19%8]) with mapi id
 15.01.2507.023; Thu, 10 Aug 2023 04:35:13 +0200
From:   "CABRERA RABADAN, ESTHER" <cabrerare@llagosta.cat>
Subject: RE: urgent- 
Thread-Topic: urgent- 
Thread-Index: AdnLLxFc4KwxrsWDMEW8t6SL78j+4g==
Date:   Thu, 10 Aug 2023 02:35:13 +0000
Message-ID: <05d394ce00c04a2c8c8a24852d35203f@llagosta.cat>
Reply-To: "db1985db77@gmail.com" <db1985db77@gmail.com>
Accept-Language: ca-ES, es-ES, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.171.10]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
To:     Undisclosed recipients:;
X-Spam-Status: No, score=3.1 required=5.0 tests=BAYES_50,
        FREEMAIL_FORGED_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



-----

Deár Friend,
Did you rècèive my èmail règárding á businèss proposal???If intèrèsted do reply for morè dètáil.

David.
Stáff-Mèmbèr of Dánskè-Bank hèrè in Swèden






