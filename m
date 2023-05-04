Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7B816F6836
	for <lists+linux-gpio@lfdr.de>; Thu,  4 May 2023 11:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjEDJWx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 May 2023 05:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbjEDJWv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2023 05:22:51 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0DA40DB
        for <linux-gpio@vger.kernel.org>; Thu,  4 May 2023 02:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3WPXBWsai1wmGE+2sw0PWFCzRTgY3/C863d2MzvbFhdbWOEhbeKZvxllCpkwgcozwx1DITvCmpIzIqJ8oTKbLyszBvOmPg7OjJ5SmcpiHdNxaDRMHhTlEl0umlzK5Og6stNkIGDC3HyreQSqLbIP2c6w2K4VcZIey1Q5xSRwh33oTrKxyWa7KzxToGTljc657pKnT9A3mnlbSd19vqz4f+UczMsnZkqRzZV4U+8n/vdIGYMD6Nqhlpey39ZGe+Km2RCCidJc6l2wtqPCEUOvl7SKCmmA3/DYDNbLUWdwwCXVTy5pMuEHI4U2PVnwTq2yIAsqay7A5mM24N0dxSOSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdAepeEQsYQJjyFpVw4UrNTtVf/DA9vHsJW5sS5ArAQ=;
 b=gT54wLCYZVnLirn4KIDyXLPaEWwm+YJFkoS5xrnwTPgmI5DJLjhCOC3HIE7xfL1lapjJtfa830Kp6Kvh0eU3IS/PvBv8Gbpaa5Kq6n7agXANAww8FDMZOxnK2DPT5IvquX47mQ6D8ZbghCBK9en4PXklP2/Y75GD7UThfcYKkJG8cfteZNgVa8FJ/jG9D+c63qVaW2E0mdkGXUQnDrzGUTfUPFU+Bw/EYoyrD/ObhNnH1tgnddVZ2BhT6XVzAQaCB9OQUJGRLCyqqEfsjFlPuGnRgADKnebtk3xxufAOO5CW+cvIuqw6VPk45GOHFF5uw0lP3sDXKL24TAqUDwIqAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=comelit.it; dmarc=pass action=none header.from=comelit.it;
 dkim=pass header.d=comelit.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comelit.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdAepeEQsYQJjyFpVw4UrNTtVf/DA9vHsJW5sS5ArAQ=;
 b=gT5KxiSorF8pRrwdgx+gFoTdATISqFXPnrzLC+8YRmSDQDsFS96ERExneH9UvqUrcApfeGvHUAqQylQO7FhY9XlkrCNbdVLZ8BJa1CRTn3k788ujT7/C6XCFbhaKM9z0KgyvJw+IpuY0pNDwdRlYIq3ht03iV8ZS8ceMYeLIOp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=comelit.it;
Received: from GVXP189MB2007.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6f::13)
 by AM7P189MB0993.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:14f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Thu, 4 May
 2023 09:22:43 +0000
Received: from GVXP189MB2007.EURP189.PROD.OUTLOOK.COM
 ([fe80::4494:3e7c:9600:cf95]) by GVXP189MB2007.EURP189.PROD.OUTLOOK.COM
 ([fe80::4494:3e7c:9600:cf95%6]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 09:22:43 +0000
From:   Milo Spadacini <milo.spadacini@comelit.it>
To:     linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Cc:     Milo Spadacini <milo.spadacini@comelit.it>
Subject: [PATCH] tools: gpio: fix debounce_period_us output of lsgpio
Date:   Thu,  4 May 2023 11:22:17 +0200
Message-Id: <20230504092217.484339-1-milo.spadacini@comelit.it>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0126.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::23) To GVXP189MB2007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2007:EE_|AM7P189MB0993:EE_
X-MS-Office365-Filtering-Correlation-Id: bc07c23b-b03b-4abf-0eca-08db4c811d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x3nOvADvFQr0N3gytsQ67+y8QQsil1iHU3mo4O+RlF91eHkIO12uQmhwlsjJ9Ulp2MapmtkyHtZLVJxWmToxkpmfo8/yUkMotGsJlECrSEKwyvltKUMDT5qtEnMq8Oul5RDg4sleCaJPx5As6LaDK/1rPuAREogp0BqxmoK/bkjOme9NSeOGDVstx4LLy1UPGtQ6falkY5lJZK4YKBGigLEiny1mLbZoFs+onxkg88djL1EXuFrFivJVsvHrh1H0d3v/gYzqjKi0wuyY+IcvKmAdLL+pDAm3e4L9fq+dLlMm/4YgjTgvgrc70PlNBeu1p5gV8bb6JT0ok7UYheRmSs+fXmt+KM6EM5Hukg+jkuloaB/LC7zUfqSfUngXZU12zFqrxCKeIxCYcwjn8CDSe3rZMbk7Vmr3/Ibq7vfc/4ly024zJr6LGFel8lqSsN4DMHwZy/zKaEmsWE0Jwhj8yDJP3y/fFBibSzaZPliYdxBHmUrhPlbGKTEIMnfH42Q4uLHm6ZxmPZHykrQ24hOHgvn506dhE8RK3jjTx19khmdVjRbdv913P2poUVydLFbvl2rMnm1rEbiTHSnRahTGTyp8BgKimoyYPr1kib3Q2MLqN5Hsa/7pesFuRScjER48VMNQLR/YQh6FZ5h/9W4GAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2007.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39850400004)(346002)(376002)(451199021)(66899021)(6486002)(15974865002)(5660300002)(38350700002)(2906002)(66556008)(44832011)(38100700002)(36756003)(316002)(86362001)(66476007)(66946007)(41300700001)(8676002)(4326008)(8936002)(83380400001)(107886003)(1076003)(186003)(52116002)(26005)(478600001)(6506007)(6512007)(6666004)(2616005)(443324007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9mxxhdj700X3f54vM8ETMV6v6xvLKBhiWjRdwVUeRw3ZFtO2Fyjx7YVauMqy?=
 =?us-ascii?Q?281dLIDrkdeFenCxh6m5t1k+rdbZKyoyxYiIhMmxPLdiW+NwEantAuQI5Oad?=
 =?us-ascii?Q?kLBio3pZ7xOy8M6qmENWWLlJKY/KqmPADum7ExYJLG4u6fvc1ciaNUq/DiYE?=
 =?us-ascii?Q?PdtZMJ8iaZLjRvUftxAg2DUfc1c4axipOBiHrPyy8dVrxS2B6E0WkR2zRehu?=
 =?us-ascii?Q?zbkU0C4HqzxiyXXtdsNJpZMLHPw9Lqggw8x6ojr0IHwA34WiznaQrKHg6y5B?=
 =?us-ascii?Q?zkqJYRQkvUvkSAOz+BNH9a7kWZfIJNi3mZxH7o2FoMLQgp0+n2HBHzBsuEFk?=
 =?us-ascii?Q?cvPYnfZ3dD73fSFQPQjWkx5Po+txJXr0DockfX7YlqdJbC2LJFiY+eAoqdjf?=
 =?us-ascii?Q?L99bjq449NlEJugS7/8HAeKnF1jUVJ0sJYctmMsIxhwRwYZZmk01hqlWc/rH?=
 =?us-ascii?Q?6gx/Wt/Su7NT3JS00joQVUVwuqHZ/+qJc/kBSadMgl9Mkd+UJnWKCAh5jyeb?=
 =?us-ascii?Q?CfbTVd+UzQBNBQa3joW/p22P+FCKnBw5j5HCWHdDgcJDqQdqEETIz9fYFtNW?=
 =?us-ascii?Q?79pyYjNTBJY+G3Yxi2pWUSpJnMSkwTRWtzfmxE/CjSD7mMm2AjLAJFOqBib7?=
 =?us-ascii?Q?X6dGZxov8uUQml4HsQMvgfS6ywZU+k1FWAlTIHMU525az26/n8+I7pg4RrDP?=
 =?us-ascii?Q?yxy3Swx2cASb6BLwJk0HvaeNuYw6/PVmC5AENoblYs8QWSSltmel3/kshPTG?=
 =?us-ascii?Q?eXunGZWihhYQrqwu+8EMNA3h6HScGs1DaUrqKQi/XxuElnm9iDCZ1QcvhJcB?=
 =?us-ascii?Q?7cJXksGcw4jnNbqQxiAxZgwKk4vpWVfUM840+8jeYogF6mlEXhmXcfuLEinj?=
 =?us-ascii?Q?TxHWaASCfM/+OgAZ00Wv0X/ztT8kkxrIyMwUGAdZGF+BUHLUU9iVlt2R1Sld?=
 =?us-ascii?Q?qTxobS9yPBDIAXucYkc/n1C07Ndu8B4vEg3/8+ysMUPyLi+kSVQ0XRu30BqO?=
 =?us-ascii?Q?fmSOHYa+5K3JnE5f/fjE0m9XgSoNZs5tElCV5qJOVHEJnT+oIKPs844tBGRU?=
 =?us-ascii?Q?T6cgV429YBlTzXMeVy+cL91uxyii6DQ/zsfdqC2eWetsV2eJTuIMlJJggo3O?=
 =?us-ascii?Q?wfIQgr6o3xTyqwuJTIn8cgtzi42xuZl1MvFjwq1v5jiW+KUbY0TJNB450H/O?=
 =?us-ascii?Q?NzcdwJMd9gNXam7Z7DsHhv4loZej+V2cEqbHgax4pgQexICPYVyXogLLlvtj?=
 =?us-ascii?Q?CG9izXtL6QmhCfcDCBIrqpQOQCcgFxMHUGT/1/eVHnV1N4zJJjoXexAiBOuK?=
 =?us-ascii?Q?gC1VuRmpjOxRh23WnNAlgzUpPJYGKFihBGgJUjlsBhu8N+YvBMaLahNYSPKO?=
 =?us-ascii?Q?hzPAMTgOcq+RHdh/Rcxdmadqe3wi8GSOSrWbzRpk3dX+Deg6B+6OxMEWK+2P?=
 =?us-ascii?Q?O90C38TKcgrLw4VpJ/5D3PeLECE49nu8glzHzBOWCK4DLXy/8Z3GFGexDu20?=
 =?us-ascii?Q?jfolxwpYmQKElW5AWiLy9B6sSyx0x1AUg4+cPLtGCBQIqTC6mqMlIAlfox/2?=
 =?us-ascii?Q?A8JwHLog93wwcylpPT9JJ19wQ3p/g3VulqDmmPO9bIOnvYtKnUZ2mTjsesaU?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: comelit.it
X-MS-Exchange-CrossTenant-Network-Message-Id: bc07c23b-b03b-4abf-0eca-08db4c811d7c
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2007.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 09:22:43.3991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 416a2da6-8a9f-486f-b294-a5ac08e7f000
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d52dYkzFSVjHXKzZj85dse9PRZiaN9g0cNp6hdFoDyPqyv5ZIIIIxjJz+zlcZW11omdvA6mmWISP4ANhpp9ahPLi0uY8/wZ+4nwG/7pIymM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0993
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix wrong output that could occurs when more attributes are used and
 GPIO_V2_LINE_ATTR_ID_DEBOUNCE is not the first one.
---
 tools/gpio/lsgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index c61d061247e1..52a0be45410c 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -94,7 +94,7 @@ static void print_attributes(struct gpio_v2_line_info *in=
fo)
        for (i =3D 0; i < info->num_attrs; i++) {
                if (info->attrs[i].id =3D=3D GPIO_V2_LINE_ATTR_ID_DEBOUNCE)
                        fprintf(stdout, ", debounce_period=3D%dusec",
-                               info->attrs[0].debounce_period_us);
+                               info->attrs[i].debounce_period_us);
        }
 }

--
2.34.1

[https://www.comelitgroup.com/firma/banner.jpg]<https://www.comelitgroup.co=
m/it-it/cctv-advance-la-nuova-gamma-di-videosorveglianza-professionale-di-c=
omelit>

NORME DI ACCESSO E DI COMPORTAMENTO PER ESTERNI<https://www.comelitgroup.co=
m/it-it/norme-accesso-comportamento-esterni>

AVVISO DI CONFIDENZIALIT=C0 E PRIVACY
Questo messaggio ed i suoi eventuali allegati possono contenere informazion=
i confidenziali, di propriet=E0, legalmente protette. =C8 destinato all'uti=
lizzo esclusivo del destinatario sopra indicato; la natura privata e la con=
fidenzialit=E0 non sono modificati da eventuali errori di trasmissione, pur=
 avendo il mittente assunto tutte le misure di sicurezza idonee e preventiv=
e per evitarli. Il trattamento dei dati ivi contenuti, e quelli che verrann=
o forniti in risposta, =E8 realizzato in conformit=E0 alla normativa sulla =
privacy Reg 679/2016, potrete prendere visione della informativa anche visi=
tando il sito www.comelitgroup.com ovvero sulle app Comelit. Rispondendo al=
la presente mail dichiarate di aver preso visione della richiamata informat=
iva e di aver prestato il consenso al trattamento dei dati personali. Se il=
 messaggio non =E8 a lei destinato, non deve utilizzarlo, diffonderlo, copi=
arlo con qualunque mezzo, o intraprendere azioni basandosi su di esso. Se h=
a ricevuto questo messaggio per errore, la preghiamo di volerlo distruggere=
 (unitamente ad eventuali copie dello stesso e suoi allegati) e di volerci =
cortesemente informare del fatto scrivendo al mittente.
CONFIDENTIALITY NOTICE AND PRIVACY
This message and its attachments (if any) may contain confidential, proprie=
tary or legally privileged information and it is intended only for the use =
of the addressee named above. No confidentiality or privilege is waived or =
lost by any erroneous transmission, despite having taken all the security a=
nd preventative measures to avoid it. The processing of personal data conta=
ined therein, and those that will be provided in response, is made in compl=
iance with the privacy regulation Reg 679/2016, you can also read the infor=
mation by visiting www.comelitgroup.com or on Comelit apps. Responding to t=
his email, you declare that you have read the aforementioned information an=
d have given consent to the processing of personal data If you are not the =
intended recipient of this message, you are hereby notified that you must n=
ot use, disseminate, copy it in any form or take any action in reliance on =
it. If you have received this message in error, please, delete it (and any =
copies of it and attachment) and kindly inform the sender.
